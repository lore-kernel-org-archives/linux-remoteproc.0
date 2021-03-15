Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345F6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 13:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07FA064EE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 13:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhCONi5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Mar 2021 09:38:57 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:38442 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229660AbhCONiy (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Mar 2021 09:38:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615815534; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=t2G4Y1dnZ78kKpozKsw/Dxs3XcY6dgOA3b8R4Tyiq2k=;
 b=MA9Ea9UNzRhFqLm8H8KWiv15i060r966Fy4DEKTkS8a5T3M+S7+ZmPRMOy36YnzRhf1ldhNR
 ArtNT74oURALt15p/RK7Tgh9gljMTP5TD8VYIgK3qVIZ1t0jeqZe+iKXIbW3ilb7qPvxStIw
 FEZA72tWZ2EuXuIXWd+XXcuN+hY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 604f63671de5dd7b99009a57 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 13:38:47
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 958FFC433ED; Mon, 15 Mar 2021 13:38:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6170C433CA;
        Mon, 15 Mar 2021 13:38:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Mar 2021 19:08:45 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
In-Reply-To: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
Message-ID: <1cb4a183234f00c0077b5a95c475a4cc@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-03-10 12:58, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 
> ++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> index 1337a3d..edad5e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> @@ -9,6 +9,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  	Definition: must be one of:
>  		    "qcom,qcs404-cdsp-pil",
>  		    "qcom,sdm845-adsp-pil"
> +		    "qcom,sc7280-wpss-pil"
> 
>  - reg:
>  	Usage: required
> @@ -24,7 +25,13 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - interrupt-names:
>  	Usage: required
>  	Value type: <stringlist>
> -	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	Definition: The interrupts needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +	qcom,qcs404-cdsp-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	qcom,sc7280-wpss-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +		"shutdown-ack"
> 
>  - clocks:
>  	Usage: required
> @@ -35,19 +42,17 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - clock-names:
>  	Usage: required for SDM845 ADSP
>  	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> -		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
> -		    and "qdsp6ss_core".
> -
> -- clock-names:
> -	Usage: required for QCS404 CDSP
> -	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> -		    "q6ss_master", "q6_axim".
> +	Definition: The clocks needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +		must be "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> +		"lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep",
> +		"qdsp6ss_core"
> +	qcom,qcs404-cdsp-pil:
> +		must be "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> +		"q6ss_master", "q6_axim"
> +	qcom,sc7280-wpss-pil:
> +		must be "gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +		"gcc_wpss_rscp_clk"
> 
>  - power-domains:

IIRC wpss requires both cx and mx. So you'll
need to add driver code to support multiple
power-domains.

>  	Usage: required
> @@ -65,7 +70,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>          Definition: must be "pdc_sync" and "cc_lpass"
> 
>  - reset-names:
> -        Usage: required for QCS404 CDSP
> +        Usage: required for QCS404 CDSP, SC7280 WPSS
>          Value type: <stringlist>
>          Definition: must be "restart"

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
