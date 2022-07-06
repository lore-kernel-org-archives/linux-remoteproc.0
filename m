Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7533C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jul 2022 12:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbiGFMoR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jul 2022 08:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiGFMoQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jul 2022 08:44:16 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E04D4C
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jul 2022 05:44:16 -0700 (PDT)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F30D33F756;
        Wed,  6 Jul 2022 14:38:57 +0200 (CEST)
Message-ID: <b75e45fc-eede-d44d-9c0d-535923de2f9d@somainline.org>
Date:   Wed, 6 Jul 2022 14:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V3 1/7] remoteproc: qcom: pas: Add decrypt shutdown support for
 modem
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mathieu.poirier@linaro.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1657022900-2049-1-git-send-email-quic_sibis@quicinc.com>
 <1657022900-2049-2-git-send-email-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <1657022900-2049-2-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5.07.2022 14:08, Sibi Sankar wrote:
> The initial shutdown request to modem on SM8450 SoCs would start the
> decryption process and will keep returning errors until the modem shutdown
> is complete. Fix this by retrying shutdowns in fixed intervals.
> 
I'm sorry, but this message seems a bit cryptic to me.. What
is being decrypted? How is it related to the shutdown sequence?
Why does it need to finish first?

Konrad

[snipped the rest]
