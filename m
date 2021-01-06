Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6C7C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 04:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F3E122D75
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 04:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbhAFEUD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 23:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFEUC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 23:20:02 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79894C06134D
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jan 2021 20:19:22 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id p14so1542519qke.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jan 2021 20:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u+rZTgPQ/0tYd3Q31a5yndOfQlqM+ffAw2M2RQLrP9Q=;
        b=yrawTDvHsjFvSCz1+bQA79KljxWL4RkQREP8vqoQRrSudyNjL5fvJ+fvKe+8rtM0h6
         iexQ5282IhJyo/AJA4Vkss2w+huVTU25wQu0Z9hhA8zPCQhDa7GLg1tbq5Ad3vOF3KY2
         tOFmI8+lizcZuiVHMWBv8Gvjo86caYhDU1c4MOOh/W47oV6OMEbx3NHutFYqiPNoat+j
         d0vcv84v+g1B24EhOq8XSeNAczGCoCjWHy3IutJpdz3yaEa3Ewu/af7W2qMn42yc88uW
         3xKgU4JtddiepxaeVRab4r6gWgdYxTm11S0Bg5UDi76a6OlE5Uksv5v91bxCKn9GH8HB
         2UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u+rZTgPQ/0tYd3Q31a5yndOfQlqM+ffAw2M2RQLrP9Q=;
        b=THUnRNQwTkP+Jxp2+wEyUvv+Z6+Zl2Yl/8gPT6gt4fzDZb9qsAyWVlCZmMI0XF0uMw
         Qw7EiObgHiZzDuchTYrB/70g4Bn/IxpgsnTpC9oIJRuWES4qU93pZLn4UbvsQ0+uARG9
         gztF3XA0JW9i/fZMdcMi5jcfRAEEqEbx2F7MV7PEOxNUcjk+7M8wtdcrnUYpVnyhU/yk
         bEkpMe3uXjxJqUcF9xRNPq8gyxH62mvDaIRt77rrMk9QijBrgIHkx5JsxFnbAmd9dNZ9
         6FclEfCFhuH6WO6APH5yFYKN/+Xw0Vu53NT93JtlCF0ETzh6t2RoObYN42iBmFbd087H
         Rm7A==
X-Gm-Message-State: AOAM530n64KJGiR8eXddFA+o2uq5BxY1u01ns+CIsNY8ce5rCqvUMl2M
        VPUtvjeIAFJnx8CoqoPuy1PxQg==
X-Google-Smtp-Source: ABdhPJxbIickrC2TsmgL5GUzwX9jnmOjni5nZnGWx8E2KzrC15rbaZoNRbshNcXAhQK23LuRgEzCZw==
X-Received: by 2002:a37:b204:: with SMTP id b4mr2789502qkf.72.1609906761519;
        Tue, 05 Jan 2021 20:19:21 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 1sm796693qki.50.2021.01.05.20.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 20:19:20 -0800 (PST)
Subject: Re: [PATCH] rpmsg: glink: add a header file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        kernel test robot <lkp@intel.com>
Cc:     agross@kernel.org, ohad@wizery.com, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210105235528.32538-1-elder@linaro.org>
 <202101061021.f4FjA3GK-lkp@intel.com> <X/U2MmdpU96WdUGw@builder.lan>
From:   Alex Elder <elder@linaro.org>
Message-ID: <f2325ccf-3d59-0c26-9371-20734cc61376@linaro.org>
Date:   Tue, 5 Jan 2021 22:19:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/U2MmdpU96WdUGw@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 1/5/21 10:01 PM, Bjorn Andersson wrote:
> On Tue 05 Jan 20:42 CST 2021, kernel test robot wrote:
> 
>> Hi Alex,
>>
>> I love your patch! Yet something to improve:
>>
> 
> Alex, this turns out to be an existing problem. Please have a look at my
> proposal for a fix here:
> 
> https://lore.kernel.org/linux-remoteproc/20210106035905.4153692-1-bjorn.andersson@linaro.org/T/#u
> 
> If you like it I can merge it and then apply this patch on top.

Go ahead and merge your patch.  If you are sure mine will
work afterward (I think it will) I would be happy to have
you accept that as well.  Thanks.

					-Alex

> 
> Thanks,
> Bjorn
> 
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.11-rc2 next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
>> config: x86_64-randconfig-s021-20210106 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce:
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>>          # https://github.com/0day-ci/linux/commit/333b19e6f90b89d18b94be972c0823959373dad8
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Alex-Elder/rpmsg-glink-add-a-header-file/20210106-080024
>>          git checkout 333b19e6f90b89d18b94be972c0823959373dad8
>>          # save the attached .config to linux build tree
>>          make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/rpmsg/qcom_glink_ssr.c:65:6: error: redefinition of 'qcom_glink_ssr_notify'
>>        65 | void qcom_glink_ssr_notify(const char *ssr_name)
>>           |      ^~~~~~~~~~~~~~~~~~~~~
>>     In file included from drivers/rpmsg/qcom_glink_ssr.c:11:
>>     include/linux/rpmsg/qcom_glink.h:27:20: note: previous definition of 'qcom_glink_ssr_notify' was here
>>        27 | static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
>>           |                    ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/qcom_glink_ssr_notify +65 drivers/rpmsg/qcom_glink_ssr.c
>>
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  60
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  61  /**
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  62   * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  63   * @ssr_name:	name of the remoteproc that has been stopped
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  64   */
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 @65  void qcom_glink_ssr_notify(const char *ssr_name)
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  66  {
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  67  	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  68  }
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  69  EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22  70
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> 

