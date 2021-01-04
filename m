Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F39C43331
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 12:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42D0021E92
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 12:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbhADMio (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 07:38:44 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:33492 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbhADMin (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 07:38:43 -0500
X-Greylist: delayed 718 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 07:38:42 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609763751;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=QWpoaB8RGoi+G5oQ88j6MdfXq1Dn+JNNjAqXCP9E/Nc=;
        b=Nv/OvM98SrAookq1nj0S8LWK0sIKBK61ffzc3Q21tXDGnqGEp1QS1WSToFOToGf7yJ
        niDJySJTemF1b+GusS0DkzxF9PA+Y4Lez2rlmokBbIDb5N1dvsvjYjx9XHU+9vPxgnv+
        uUXxG/D+kxOQ4wUL25TGI0aaYbi6tA3euQWEEsnwHD4Go+npRIsGslfr+PdXrjzzIwk6
        AE12A4Y11OHFvqmpm6KmNdXwFNhV5UH9c69EiCs8zkkNTxrvpbk4JpN16o3IZEq4cIPJ
        bxvTIw5CX1O6F3ehDQ2wA3q6+yZgTmM3vvNOc4e0aV9vzbpCYD9HuSt/qu1F4U2jq9hb
        uk0A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j+IczGa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx04CNkaER
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 4 Jan 2021 13:23:46 +0100 (CET)
Date:   Mon, 4 Jan 2021 13:23:41 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] remoteproc: qcom: wcnss: Adjust voltage requirements
 for Pronto v2
Message-ID: <X/MIzTkKZ4jb3iVY@gerhold.net>
References: <20201226141100.90147-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201226141100.90147-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Konrad,

On Sat, Dec 26, 2020 at 03:11:00PM +0100, Konrad Dybcio wrote:
> This is required for MSM8974 devices that cannot afford to push
> the regulators further.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index e2573f79a137..71480be545e4 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -124,7 +124,7 @@ static const struct wcnss_data pronto_v2_data = {
>  	.spare_offset = 0x1088,
>  
>  	.vregs = (struct wcnss_vreg_info[]) {
> -		{ "vddmx", 1287500, 1287500, 0 },
> +		{ "vddmx", 950000, 1150000, 0 },
>  		{ "vddcx", .super_turbo = true },
>  		{ "vddpx", 1800000, 1800000, 0 },
>  	},

Correct me if I'm wrong but with this change pronto_v2_data looks
exactly like pronto_v1_data (qcom,pronto-v1-pil).
Can you just change the compatible in qcom-msm8974.dtsi?

Also, if possible MSM8974 should be also moved to corner votes via rpmpd,
like in https://lore.kernel.org/linux-arm-msm/20200916104135.25085-1-stephan@gerhold.net/
Then the actual voltages don't matter anymore (all we need to do here is
to temporarily scale the power domain to maximum so WCNSS can boot up).

Thanks,
Stephan
