Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8E8C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 19:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A470E61076
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 19:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbhFNTRr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 15:17:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37582 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbhFNTRq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:17:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15EJFOB8042719;
        Mon, 14 Jun 2021 14:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623698124;
        bh=45zAPLvQCJnaXG/Xt6NAJCtou400q1d7LTyzDd2Q70c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AG0VBXIdeICzBJk0cSMUut2tcmYZKRpgYlYEI9/EGxBReEfvo6lf1mpvTKao+AM2c
         8Qgsy4smY61YxETRYJ98jSqV13KjQHdb5wVoAmRcwP+LaHUn9V53Na18f1l1eSjOYY
         +1oZBeqW7lxnV0JYdQVz0WnXJf4Jm5nOkVY/wjNI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15EJFOmF039932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Jun 2021 14:15:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 14
 Jun 2021 14:15:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 14 Jun 2021 14:15:24 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15EJFNau072913;
        Mon, 14 Jun 2021 14:15:23 -0500
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in
 binding
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, <devicetree@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210603144216.10327-1-s-anna@ti.com>
 <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <cd7ab36e-76f3-3d13-6896-6d812c66b0e3@ti.com>
Date:   Mon, 14 Jun 2021 14:15:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 6/7/21 8:19 AM, Rob Herring wrote:
> On Thu, Jun 3, 2021 at 9:42 AM Suman Anna <s-anna@ti.com> wrote:
>>
>> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
>> $id and fails to compile the example due to undefined args specifier
>> values for clocks and resets. Fix both of these issues.
>>
>> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Wilken,
>>
>> This fixes the warnings for now on linux-next, but I think the example
>> should be including sun6i-a31-ccu.h files instead to be accurate, and
>> those files are missing the definitions for CLK_BUS_SPINLOCK and
>> RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
>> patch on top.
>>
>> regards
>> Suman
>>
>>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Gentle ping, can you pick up this patch and the remoteproc pas binding
indentations fixes please so that linux-next is sane w.r.t these?

regards
Suman
