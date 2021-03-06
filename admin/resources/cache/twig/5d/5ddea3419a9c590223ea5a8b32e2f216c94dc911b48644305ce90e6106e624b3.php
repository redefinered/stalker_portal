<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* default/TvChannels/move_channel/move_channel.js.twig */
class __TwigTemplate_f5823356cdd7667ef7b02caec2461dacfb3126fc9e6ad72ba207987067d2c90e extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        // line 1
        echo "
        var actionFlag = false, channel_id = ";
        // line 2
        (($this->getAttribute(($context["app"] ?? null), "channel_id", [], "any", true, true)) ? (print (twig_escape_filter($this->env, $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "channel_id", []), "html", null, true))) : (print ("false")));
        echo ";

        var channelList = [];

        var actionTimer = window.setInterval(function(){
            if (actionFlag === false ) {
                if (\$(document).queue('moveQueue').length > 0) {
                    \$(document).dequeue('moveQueue');
                } else {
                    actionFlag = false;
                }
            }
        }, 50);

        var conf = {
            form: '#form_',
            lang : '";
        // line 18
        echo twig_escape_filter($this->env, $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "js_validator_language", []), "html", null, true);
        echo "',
            showHelpOnFocus : true,
            validateHiddenInputs: true,
            ignore: ['.ignore'],
            modules: 'jsconf',
            onSuccess: function () {
                showModalBox();
                \$('#channelListContainer').empty().delay(1000).promise().done(function(){
                    var sendData = {};
                    \$(\"#channel_begin, #channel_end\").each(function(){
                        var val = parseInt(\$.trim(\$(this).val()));
                        sendData[\$(this).attr('name')] = !isNaN(val) ? val: '';
                    });
                    if ((sendData.channel_end - sendData.channel_begin) > 200 ) {
                        customConfirm(sendData);
                    } else {
                        \$(document).queue('moveQueue', function() {
                            actionFlag = true;
                            ajaxPostSend('";
        // line 36
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "move-channel-list-json', sendData, false, false, true);
                        });
                    }
                });
                return false;
            },
            onError: function () {
                return false;
            }
        };

        function yelp() {
            \$(document).ready(function () {

                // Add custom validation rule
                var customRuleObj = {
                    name : 'compare_number',
                    errorMessage : \"\",
                    errorMessageKey: 'badCompareNumber',
                    errorMsgContainer: \$(\"#channel_num_error\")
                };

                customRuleObj.validatorFunction = function(value, el, config, language, form) {
                    var compElem = \$(el).data('validation-compare-element');
                    var compOperation = \$(el).data('validation-compare-operation') ? \$(el).data('validation-compare-operation') : \"<=\";
                    var compElemValidationOptional = \$(compElem).data('validation-optional') || false;
                    var compRange = \$(compElem).data('validation-allowing') || false;
                    var val = parseFloat(\$(el).val());
                    var compVal = parseFloat(\$(compElem).val());
                    this.errorMsgContainer.text('').removeClass('has-error');
                    //\$(\"#channel_begin,#channel_end\").parent().removeClass('has-error');

                    if (compElem && !\$(compElem).is(\":disabled\") && !isNaN(val) && !isNaN(compVal)) {
                        if (!\$(compElem).val() && compElemValidationOptional) {
                            return true;
                        }

                        if ((compOperation == '<=' && !(val <= compVal)) || (compOperation == '>=' && !(val >= compVal))) {
                            //\$(\"#channel_begin,#channel_end\").parent().addClass('has-error');
                            this.errorMsgContainer.html(\"<span class='help-block form-error'>";
        // line 75
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("End channel number can not be less than the start channel number"), "html", null, true);
        echo "</span>\").addClass('has-error');
                            return false;
                        }
                    }
                    return true;
                };

                \$.formUtils.addValidator(customRuleObj);

                \$.validate(conf);
                \$(document).on('click', \"a.main_ajax\", function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    \$(\"#modalbox\").data('complete', 0);
                    var sendData = \$(this).data();
                    ajaxPostSend(\$(this).attr('href'), sendData, false, false);
                    return false;
                });

                \$(document).on('click', '#iptv_list_move_send', function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    moveApply();
                    return false;
                });

                \$(document).on('keyup', \"#searc_and_backlight input[type='text']\", function(e){
                    if (typeof(e) != 'undefined' && typeof(e.type) != 'undefined' && e.type=='keyup' && e.keyCode == 13) {
                        setBackLightFocus();
                        return true;
                    }
                    \$(\"#channelListContainer .box\").removeClass('shining');
                    var search = \$(this).val();
                    if (\$.trim(search) != ''){
                        \$.each(['\\\\', '[',']','<','>','=','+','*','?','|','(',')','\$','.','&', '{', '}'], function(i, val){
                            search = search.replace(val, \"\\\\\" + val);
                        });
                        
                        \$(\"#channelListContainer .box\").each(function(){
                            var searchRegExp = new RegExp(search, \"gi\");
                            if (searchRegExp.test(\$(this).find('.curr_num').text()) || searchRegExp.test(\$(this).find('.channel').text())) {
                                \$(this).find('.channel').addClass('backlight');
                            } else {
                                \$(this).find('.channel').removeClass('backlight');
                            }
                        })
                    } else {
                        \$(\"#channelListContainer .backlight\").removeClass('backlight');
                    }
                });
                
                \$(document).on('click', \"#searc_and_backlight button\", function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    setBackLightFocus();
                    return false;
                });

                \$(document).on('keypress', \"#channel_begin, #channel_end\", function(e) {
                    if (e.keyCode == 13) {
                        e.stopPropagation();
                        e.preventDefault();

                        if (\$(conf.form).isValid({}, conf, true)) {
                            conf.onSuccess();
                        } else {
                            conf.onError();
                        }
                        return false;
                    }
                });

                \$('#channelListContainer').on('click', 'a.lock-link', function (e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var childI = \$(this).children('i');
                    var offset = channelList[channelList.length - 1].old_number - channelList.length;
                    var childID = parseInt(\$(this).closest('.box').find('span.curr_num').data('number'), 10) - 1 - offset;
                    \$(document).queue('moveQueue', function(){
                        actionFlag = true;
                        if (childI.hasClass('fa-lock')) {
                            childI.removeClass('fa-lock').addClass('fa-unlock').attr('title',\"";
        // line 157
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Lock channel position"), "html", null, true);
        echo "\");
                            \$(childI).closest(\"div.box\").removeClass('sortable-disabled').addClass('sortable-enabled');
                            channelList[childID].locked = false;
                        } else {
                            childI.removeClass('fa-unlock').addClass('fa-lock').attr('title',\"";
        // line 161
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Unlock channel position"), "html", null, true);
        echo "\");
                            \$(childI).closest(\"div.box\").addClass('sortable-disabled').removeClass('sortable-enabled');
                            channelList[childID].locked = true;
                        }
                        ajaxPostSend('";
        // line 165
        echo twig_escape_filter($this->env, $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [], "array"), "html", null, true);
        echo "/toogle-lock-channel', {data:{1: {id: childI.data('id'), locked: channelList[childID].locked, number: channelList[childID].number} } });
                        initListItemsPosition(\$(this).closest('.droptrue'));
                        \$(\"#modalbox\").data('complete', 1);
                    });
                    return false;
                });

                \$('#channelListContainer').on('click', 'a.remove-link', function (e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var currNum = parseInt(\$(this).closest('.box').find('span.curr_num').text(), 10) - 1;

                    \$(document).queue('moveQueue', function(){
                        actionFlag = true;
                        var maxNumber = 0, listPos, itemIDs = [];

                        \$.each(channelList, function(num, obj){
                            if (obj.id) {
                                itemIDs.push(obj.id);
                            }
                            if (obj.number > maxNumber) {
                                maxNumber = obj.number;
                            }
                            if ((currNum + 1) == obj.number) {
                                listPos = num;
                            }
                        });

                        var sendData = {channel_begin: maxNumber + 1, channel_end: maxNumber + 1, oneitem: typeof(listPos) != 'undefined' ? listPos: -1, ex_item_ids: JSON.stringify(itemIDs)};
                        ajaxPostSend('";
        // line 195
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "move-channel-list-json', sendData, false, false, false);
                    });
                    return false;
                });

                \$('#channelListContainer').on('click', 'a.counter-add-link', function (e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var offset = channelList[channelList.length - 1].old_number - channelList.length,
                        currList = \$(this).closest('div.counter').next('div.ui-sortable'),
                        targetList;

                    if (\$('.sortable-enabled:not(.empty)', currList).length == 0) {
                        return false;
                    }

                    targetList = currList;

                    var notEmptyBlock = \$('.sortable-enabled:not(.empty):first', targetList);

                    while(targetList.length){
                        if (notEmptyBlock.length && notEmptyBlock.hasClass('empty')){
                            break;
                        } else if (notEmptyBlock.next().length) {
                            notEmptyBlock = notEmptyBlock.next();
                        } else {
                            targetList = targetList.parent('div').next('div').children('div.ui-sortable');
                            if (targetList.length){
                                notEmptyBlock = \$('.sortable-enabled:first', targetList);
                            }
                        }
                    }

                    if (!targetList.length) {
                        return false;
                    }

                    var targetItem;
                    if (targetList.data('blocknum') != currList.data('blocknum')) {
                        targetItem  = \$('.sortable-enabled.empty:first', targetList);
                    } else {
                        targetItem  = \$('.sortable-enabled.empty:last', targetList);
                    }

                    var lastBlockNum = \$('span[data-number]', targetItem).data('number') - 1 - offset,
                        lastChannel = channelList[lastBlockNum],
                        addItem = {
                            link: '',
                            number: lastChannel.number,
                            old_number: lastChannel.old_number,
                            changed: false,
                            notempty: '0',
                            empty: 'empty',
                            notlocked: '1',
                            locked: 'sortable-enabled',
                            instance: undefined
                        };

                    addItem['instance'] = \$(\"#list_item\").tmpl(addItem).insertBefore(\$('.sortable-enabled:first', currList));

                    channelList[lastBlockNum].instance.remove();
                    channelList[lastBlockNum] = addItem;
                    \$('#channelListContainer').delay(10).promise()
                        .done(function() {sortAndMove(currList, -1);})
                        .done(function () {
                            \$('div.ui-sortable', this).each(function () {
                                initListItemsPosition(this);
                            });
                        });

                    return false;
                });

                \$(document).on('click', '#iptv_list_move_show', function(e){
                    e.stopPropagation();
                    e.preventDefault();

                    if (\$(conf.form).isValid({}, conf, true)) {
                        conf.onSuccess();
                    } else {
                        conf.onError();
                    }
                    return false;
                });

                \$( document ).on('show', \"div.droptrue\",function(e){
                    \$(this).sortable({
                        connectWith: \"div.droptrue\",
                        cancel: \".sortable-disabled\",
                        items: '.sortable-enabled',
                        create: function(){
                            initListItemsPosition(this);
                        },
                        stop: function( event, ui ) {
                            var sourceList = \$(event.target),
                                destList = \$(ui.item).closest('.ui-sortable'),
                                sourceNum = sourceList.data('blocknum'),
                                destNum = destList.data('blocknum'),
                                forward = sourceNum <= destNum ? 1 : -1;

                            sortAndMove(destList, forward);
                        }
                    });
                    \$(this).disableSelection();
                });

                // initial list load
                conf.onSuccess();

                \$(\"#modalbox .devoops-modal-bottom\").on('click', \"button[type='reset']\", function(e){
                    \$(\"#modalbox button[type='button']\").off('click');
                    JScloseModalBox();
                });

            });
        }

        document.addEventListener( \"DOMContentLoaded\", yelp, false );

        function setBackLightFocus(){
            var first = \$(\"#channelListContainer .box .backlight\").get(0);
            if (!\$(first).closest('.box').hasClass('shining')) {
                \$(first).closest('.box').addClass('shining')
                \$('#channelListContainer').scrollTo(\$(first).closest('.box'), 'slow');
                return;
            }
            \$(\"#channelListContainer .box .backlight\").each(function(index){
                var parent = \$(this).closest('.box');
                if (index == 0 || parent.hasClass('shining')) {
                    return true;
                } else if (index == \$(\"#channelListContainer .box .backlight\").length - 1){
                    \$(\"#channelListContainer .box\").removeClass('shining');
                    \$('#channelListContainer').scrollTo(parent, 'slow');
                    return false;
                }

                \$('#channelListContainer').scrollTo(parent, 'slow');
                parent.addClass('shining');
                return false;
            });
        }

        function channelListRender(container){

            var _container = \$(container);
            _container.empty();
            var maxBlockHeight = \$(window).height()- _container.offset().top - 50;
            _container.height(maxBlockHeight);
            //maxBlockHeight -= \$(document).height() - \$(window).height();
            _container.height(maxBlockHeight - 40);
            var maxBlockWidth = \$(window).width()- _container.offset().left - 50;
            _container.width(maxBlockWidth+10);
            var maxItemOnBlock = Math.floor(maxBlockHeight/50);
            var currentCount = 0;
            for (var i= 0; i< channelList.length; ) {
                var currentBlock = \$(\"<div/>\", {'class': 'no-padding'}).appendTo(_container);
                currentBlock.hide();
                var currentItemsBlock = \$(\"<div/>\", {'class': 'no-padding droptrue'}).appendTo(currentBlock);
                currentItemsBlock.hide();
                for ( var j = currentCount; j < (currentCount + maxItemOnBlock) && j < channelList.length; j++) {
                    if (typeof(channelList[j]) == 'undefined') {
                        continue;
                    }
                    var item = channelList[j];
                    item['notempty'] = item['empty'] ? '0': '1';
                    item['empty'] = item['empty'] ? 'empty' : '';
                    item['notlocked'] = item['locked'] ? '0': '1';
                    item['locked'] = item['locked'] ? 'sortable-disabled' : 'sortable-enabled';
                    item['relocating'] = channel_id !== false && item['id'] == channel_id;
                        channelList[j]['instance'] = \$(\"#list_item\").tmpl(item).appendTo(currentItemsBlock);
                    i++;
                }

                \$(\"#list_counter\").tmpl({from: channelList[currentCount].number, to: channelList[j - 1].number}).prependTo(currentBlock);
                currentCount = j;
                currentBlock.css('top', 0);
                currentBlock.css('left', (Math.ceil(currentCount/maxItemOnBlock) - 1)*250);
                currentBlock.show();
                currentItemsBlock.data('blocknum', channelList[currentCount - 1].number);
                currentItemsBlock.show();
                if (j >= channelList.length) {
                    break;
                }
            }
            if (\$('.relocating').length != 0) {
                \$('#channelListContainer').scrollTo(\$('.relocating'));
            }
        }

        function sortAndMove(source, direction, items){
            var totalLength = \$(source).data('itemscount'),
                fixedPos = JSON.parse(\$(source).data('fixedPos') || '{}'),
                addItems = items || [], lItem, newNum, currNum;
            if (Object.keys(fixedPos).length) {
                \$('.sortable-disabled', source).detach().each(function(){
                    index = \$(this).data('pos');
                    if (typeof (fixedPos[index]) != 'undefined') {
                        fixedPos[index] = \$(this);
                    }
                });
            }
            var other = [];
            if (direction > 0 ) {
                other = \$('div.box', source).detach().toArray().concat(addItems);
            } else {
                other = addItems.concat(\$('div.box', source).detach().toArray());
            }

            var offset = channelList[channelList.length - 1].old_number - channelList.length;

            for(var i = (direction > 0 ? totalLength - 1 : 0 ); (direction > 0 ? i >= 0: i < totalLength); i-=direction){
                if (typeof (fixedPos[i]) != 'undefined' || (i == (direction > 0 ? 0 : totalLength - 1) && Object.keys(fixedPos).length == 1 )) {
                    \$(fixedPos[i])[direction > 0 ? 'prependTo': 'appendTo'](source);
                    delete(fixedPos[i]);
                } else {
                    lItem = other[direction > 0 ? 'pop': 'shift']();
                    currNum = parseInt(\$('span[data-number]', lItem).attr('data-number'), 10) - 1 - offset;
                    newNum = parseInt(\$(source).data('blocknum'), 10) - totalLength + i - offset;

                    channelList[currNum]['number'] = newNum + 1 + offset;
                    \$('span[data-number]', lItem).text(channelList[currNum]['number']);

                    \$(lItem)[direction > 0 ? 'prependTo': 'appendTo'](source);
                }
            }
            if (other.length != 0) {
                source = source.parent('div')[[direction < 0 ? 'next': 'prev']]('div').children('.ui-sortable');
                sortAndMove(source, direction, other);
            }
            \$(source).sortable( \"refresh\" );

        }

        function channelDataPrepare(data){
            if (data && data.data) {
                for (var i in data.data) {
                    data.data[i].link = data.data[i].id ? '";
        // line 432
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "edit-channel?id=' + data.data[i].id: '';
                    data.data[i].old_number = data.data[i].number;
                    data.data[i].changed = false;
                }
                channelList = data.data;
            }
            channelListRender('#channelListContainer');
            actionFlag = false;
        }

        function initListItemsPosition(sourceList){
            var fixedPos = {};
            \$(sourceList).children('div.box:not(.ui-sortable-placeholder)').each(function(i){
                var \$this = \$(this);
                if (\$this.hasClass('sortable-disabled')) {
                    \$this.data('pos', i);
                    fixedPos[i] = 0;
                }
            });
            \$(sourceList).data('itemscount', \$('div.box:not(.ui-sortable-placeholder)', sourceList).length);
            \$(sourceList).data('fixedPos', JSON.stringify(fixedPos));
        }

        function showModalBox(){
            notty('<span>";
        // line 456
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Request is being processed"), "html", null, true);
        echo "...</span>','notification');
        }
        
        var manageChannel = function (obj) {
            notty('<span>";
        // line 460
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Done"), "html", null, true);
        echo "!</span>','success');
            actionFlag = false;
            shiftStart = false;
            shiftDistance = 0;
            JScloseModalBox();
        };
        
        var manageChannelError = function(data){
            if (typeof(data.nothing_to_do) == 'undefined' || !data.nothing_to_do) {
                notty('<span>";
        // line 469
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Error"), "html", null, true);
        echo "! ' + (data.error ? data.error : '') + '</span>', 'error');
            }
            actionFlag = false;
        };
        
        var checkChanges = function(getData){
            var dataForSend = new Array(),
                getData = getData || false;

            \$.each(channelList, function(){
                if ((this.number != this.old_number || this.changed) && !this.empty) {
                    dataForSend.push({'id': this.id, 'number': this.number, 'old_number': this.old_number});
                    if (getData) {
                        this.old_number = this.number;
                    }
                }
            });

            return getData? dataForSend : dataForSend.length > 0;
        };

        function customConfirm(sendData){
            \$(\"#modalbox .modal-header-name\").html(\"";
        // line 491
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Warning"), "html", null, true);
        echo "\");
            \$(\"#modalbox .devoops-modal-inner\").html(\"\\n\\
            <div class='col-md-12'>\\n\\
                <span class='col-md-12 txt-default'>\\n\\
                    ";
        // line 495
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Attention! Processing list of more than 200 elements can greatly affect the performance and usability of this section of the admin panel. Are you sure you want to continue?"), "html", null, true);
        echo "\\n\\
                </span>\\n\\
            </div>\");
            \$(\"#modalbox .devoops-modal-bottom button\").detach().remove();
            \$(\"#modal_form_buttons\").tmpl({ok_title: \"";
        // line 499
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Get channels"), "html", null, true);
        echo "\"}).appendTo(\"#modalbox .devoops-modal-bottom\");

            \$(document).off('click', \"#modalbox button[type='button']\");
            \$(document).on('click', \"#modalbox button[type='button']\", function(e){
                \$(document).queue('moveQueue', function() {
                    actionFlag = true;
                    ajaxPostSend('";
        // line 505
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "move-channel-list-json', sendData, false, false, false);
                    JScloseModalBox();
                });
            });

            \$(\"#modalbox\").show();
        }

        function customConfirm2(confFunc){
            \$(\"#modalbox .modal-header-name\").html(\"";
        // line 514
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Warning"), "html", null, true);
        echo "\");
            \$(\"#modalbox .devoops-modal-inner\").html(\"\\n\\
            <div class='col-md-12'>\\n\\
                <span class='col-md-12 txt-default'>\\n\\
                    ";
        // line 518
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("You have unsaved data. First you need to save it. Do it?"), "html", null, true);
        echo "\\n\\
                </span>\\n\\
            </div>\");
            \$(\"#modalbox .devoops-modal-bottom button\").detach().remove();
            \$(\"#modal_form_buttons\").tmpl({ok_title: \"";
        // line 522
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("Save"), "html", null, true);
        echo "\"}).appendTo(\"#modalbox .devoops-modal-bottom\");

            if (typeof (confFunc) == 'function') {
                \$(document).off('click', \"#modalbox button[type='button']\");
                \$(document).on('click', \"#modalbox button[type='button']\", function(e){
                    confFunc();
                });
            }

            \$(\"#modalbox\").show();
        }

        function moveApply() {
            \$(document).queue('moveQueue', function() {
                actionFlag = true;
                var dataForSend = checkChanges(true);
                showModalBox();
                ajaxPostSend('";
        // line 539
        echo twig_escape_filter($this->env, $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [], "array"), "html", null, true);
        echo "/move-apply', {data: dataForSend});
                \$(\"#modalbox\").data('complete', 1);
            });
        }

        function appendToEnd(data) {
            var targetItemContainer = \$('#channelListContainer div.ui-sortable:last');
            if (typeof (data.oneitem) != 'undefined' && channelList[data.oneitem]) {
                var addItem  = data.data[0],
                    start_num = channelList[data.oneitem].old_number;

                addItem.link = addItem.id ? '";
        // line 550
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "edit-channel?id=' + addItem.id: '';
                addItem.number = channelList[data.oneitem].number;
                addItem.old_number = channelList[data.oneitem].old_number;
                addItem.changed = true;

                addItem['notempty'] = addItem['empty'] ? '0': '1';
                addItem['empty'] = addItem['empty'] ? 'empty' : '';
                addItem['notlocked'] = addItem['locked'] ? '0': '1';
                addItem['locked'] = addItem['locked'] ? 'sortable-disabled' : 'sortable-enabled';

                addItem['instance'] = \$(\"#list_item\").tmpl(addItem).insertAfter(\$('#channelListContainer div.ui-sortable .sortable-enabled:last'));

                channelList[data.oneitem].instance.remove();
                channelList[data.oneitem] = addItem;

                targetItemContainer = addItem['instance'].closest('div.ui-sortable');

                //\$('#channelListContainer div.ui-sortable:last').sortable( \"refresh\" );
                //ajaxPostSend('";
        // line 568
        echo twig_escape_filter($this->env, ((($this->getAttribute($this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "request_context", []), "baseUrl", []) . "/") . $this->getAttribute(($context["app"] ?? $this->getContext($context, "app")), "controller_alias", [])) . "/"), "html", null, true);
        echo "move-channel-move-number', {start_num: start_num, direction: -1});
            }

            \$('#channelListContainer').delay(10).promise()
                .done(function() {
                    sortAndMove(targetItemContainer , 1);
                })
                .done(function() {
                    \$('div.ui-sortable', this).each(function(){
                        initListItemsPosition(this);
                    });
                    actionFlag = false;
                });
        }

        window.onunload = function(){
            if (checkChanges()) {
                return \"";
        // line 585
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("You have unsaved data. Really want to go?"), "html", null, true);
        echo "\";
            }
        }; 
            
        window.onbeforeunload = function(){
            if (checkChanges()) {
                return \"";
        // line 591
        echo twig_escape_filter($this->env, $this->env->getExtension('Lib\EmptyTranslationExtension')->trans("You have unsaved data. Really want to go?"), "html", null, true);
        echo "\";
            }
        };
";
    }

    public function getTemplateName()
    {
        return "default/TvChannels/move_channel/move_channel.js.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  691 => 591,  682 => 585,  662 => 568,  641 => 550,  627 => 539,  607 => 522,  600 => 518,  593 => 514,  581 => 505,  572 => 499,  565 => 495,  558 => 491,  533 => 469,  521 => 460,  514 => 456,  487 => 432,  247 => 195,  214 => 165,  207 => 161,  200 => 157,  115 => 75,  73 => 36,  52 => 18,  33 => 2,  30 => 1,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "default/TvChannels/move_channel/move_channel.js.twig", "/var/www/html/stalker_portal/admin/resources/views/default/TvChannels/move_channel/move_channel.js.twig");
    }
}
