Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF45C43334
	for <linux-remoteproc@archiver.kernel.org>; Sun, 17 Jul 2022 03:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbiGQDv1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiGQDv0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Jul 2022 23:51:26 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD1E5F75
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:51:25 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10cf9f5b500so14630565fac.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GfIEvDMkb7XLpCU/9p565Kmb1QT30uo9MIf3FpLBdtI=;
        b=ja+nd/8X+GwVF8cnOSwQ15sfaWTcxB8mK715Q9w9U5vLPgtqikY6+80bdbElNW/7Ks
         lK91eBhxfUmBoJJxGVFVS+vvVZGmFP8X1fAE0US2KR+rssilciWhtU6ixKLU0qzMvt3K
         PGqRvZC1BlizJYXNkp3tj+JtsDmqBUxfu33AP7Hb03ayY7kJBIQyZUqKMCOR9/6rVtpE
         A9BhDbDohsH2tnZMF8UJOtHfVN4OR8fdEoSm88Mx9brTd8BGTbonjwW9tvYzo3t7y1zC
         yy6pL13A4bA7m67E7vJzI0riHUn5tY0iG1HBUxyECDjy70tHRQMK1LBh/czawHS0DpHV
         ybvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GfIEvDMkb7XLpCU/9p565Kmb1QT30uo9MIf3FpLBdtI=;
        b=dGt7109zJ30Jbn1bbl5vwJ6v6ySRMjH78YmIcwoAvEFMIe9h4r/cd4dWtlQRlY2Q3o
         SzI+KH4GEu48XO3j5fPn3F6+I0mjCekg5xd8U6wW9Nng3y5jleb34jJeZeVJd+f7VdzL
         YThOjrD8QTtpvpO8h5abSm0xZPbbdgJztltXc8SVj2gyFffSkdrLpv2kRygK89mJ391w
         SKXLLvmOWWb8IAkH6OTByOen7bYCzdguLh3Qeuw8DwEPMGxH7HqnXS+RHvR8/yRkeAvY
         4C9vurR+XvtkOodh1waCVsNptqZ7JJU6T2dIuTMDXQvRdNEC6Lb4JD1CsXL8X9nSxTzI
         Tf1A==
X-Gm-Message-State: AJIora/1uaNhdB9Dc8g6sH42uvpoNLFWZIiNKW6m5aWHQ4V8hkCshdN4
        tHmH8Ec5M38GiSYvJO55k0+4Kg==
X-Google-Smtp-Source: AGRyM1t1OUXZ94OyJPeuAUJFh1mweFpvH5VWgyHg0BN16WW7oxSRgGlLoVbIz5RaPbvkUsjNVEa4qQ==
X-Received: by 2002:a05:6870:d68e:b0:e2:af08:6cc3 with SMTP id z14-20020a056870d68e00b000e2af086cc3mr13144534oap.189.1658029884774;
        Sat, 16 Jul 2022 20:51:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j4-20020a9d1784000000b0061c4a7a37fasm3816880otj.41.2022.07.16.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:51:24 -0700 (PDT)
Date:   Sat, 16 Jul 2022 22:51:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Use _clk_get_optional for
 aggre2_clk
Message-ID: <YtOHOptMSAzHfm7a@builder.lan>
References: <20220714104309.4111334-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714104309.4111334-1-abel.vesa@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 14 Jul 05:43 CDT 2022, Abel Vesa wrote:

> There is devm_clk_get_optional now, so lets drop the has_aggre2_clk
> from adsp_data.

I like this patch, but for the history, could you please provide a
reason why you would like to do this?

Regards,
Bjorn

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++-------------------------
>  1 file changed, 7 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 6ae39c5653b1..beef7a09c380 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -34,7 +34,6 @@ struct adsp_data {
>  	const char *firmware_name;
>  	int pas_id;
>  	unsigned int minidump_id;
> -	bool has_aggre2_clk;
>  	bool auto_boot;
>  
>  	char **proxy_pd_names;
> @@ -64,7 +63,6 @@ struct qcom_adsp {
>  	int pas_id;
>  	unsigned int minidump_id;
>  	int crash_reason_smem;
> -	bool has_aggre2_clk;
>  	const char *info_name;
>  
>  	struct completion start_done;
> @@ -310,15 +308,13 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
>  		return ret;
>  	}
>  
> -	if (adsp->has_aggre2_clk) {
> -		adsp->aggre2_clk = devm_clk_get(adsp->dev, "aggre2");
> -		if (IS_ERR(adsp->aggre2_clk)) {
> -			ret = PTR_ERR(adsp->aggre2_clk);
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(adsp->dev,
> -					"failed to get aggre2 clock");
> -			return ret;
> -		}
> +	adsp->aggre2_clk = devm_clk_get_optional(adsp->dev, "aggre2");
> +	if (IS_ERR(adsp->aggre2_clk)) {
> +		ret = PTR_ERR(adsp->aggre2_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(adsp->dev,
> +				"failed to get aggre2 clock");
> +		return ret;
>  	}
>  
>  	return 0;
> @@ -457,7 +453,6 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp->rproc = rproc;
>  	adsp->minidump_id = desc->minidump_id;
>  	adsp->pas_id = desc->pas_id;
> -	adsp->has_aggre2_clk = desc->has_aggre2_clk;
>  	adsp->info_name = desc->sysmon_name;
>  	platform_set_drvdata(pdev, adsp);
>  
> @@ -531,7 +526,6 @@ static const struct adsp_data adsp_resource_init = {
>  		.crash_reason_smem = 423,
>  		.firmware_name = "adsp.mdt",
>  		.pas_id = 1,
> -		.has_aggre2_clk = false,
>  		.auto_boot = true,
>  		.ssr_name = "lpass",
>  		.sysmon_name = "adsp",
> @@ -542,7 +536,6 @@ static const struct adsp_data sdm845_adsp_resource_init = {
>  		.crash_reason_smem = 423,
>  		.firmware_name = "adsp.mdt",
>  		.pas_id = 1,
> -		.has_aggre2_clk = false,
>  		.auto_boot = true,
>  		.load_state = "adsp",
>  		.ssr_name = "lpass",
> @@ -554,7 +547,6 @@ static const struct adsp_data sm6350_adsp_resource = {
>  	.crash_reason_smem = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"lcx",
> @@ -571,7 +563,6 @@ static const struct adsp_data sm8150_adsp_resource = {
>  		.crash_reason_smem = 423,
>  		.firmware_name = "adsp.mdt",
>  		.pas_id = 1,
> -		.has_aggre2_clk = false,
>  		.auto_boot = true,
>  		.proxy_pd_names = (char*[]){
>  			"cx",
> @@ -587,7 +578,6 @@ static const struct adsp_data sm8250_adsp_resource = {
>  	.crash_reason_smem = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"lcx",
> @@ -604,7 +594,6 @@ static const struct adsp_data sm8350_adsp_resource = {
>  	.crash_reason_smem = 423,
>  	.firmware_name = "adsp.mdt",
>  	.pas_id = 1,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"lcx",
> @@ -621,7 +610,6 @@ static const struct adsp_data msm8996_adsp_resource = {
>  		.crash_reason_smem = 423,
>  		.firmware_name = "adsp.mdt",
>  		.pas_id = 1,
> -		.has_aggre2_clk = false,
>  		.auto_boot = true,
>  		.proxy_pd_names = (char*[]){
>  			"cx",
> @@ -636,7 +624,6 @@ static const struct adsp_data cdsp_resource_init = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.ssr_name = "cdsp",
>  	.sysmon_name = "cdsp",
> @@ -647,7 +634,6 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.load_state = "cdsp",
>  	.ssr_name = "cdsp",
> @@ -659,7 +645,6 @@ static const struct adsp_data sm6350_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -676,7 +661,6 @@ static const struct adsp_data sm8150_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -692,7 +676,6 @@ static const struct adsp_data sm8250_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -708,7 +691,6 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"nsp",
> @@ -723,7 +705,6 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
>  	.crash_reason_smem = 633,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 30,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"nsp",
> @@ -738,7 +719,6 @@ static const struct adsp_data sm8350_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
>  	.pas_id = 18,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -756,7 +736,6 @@ static const struct adsp_data mpss_resource_init = {
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
>  	.minidump_id = 3,
> -	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -773,7 +752,6 @@ static const struct adsp_data sc8180x_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> -	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> @@ -789,7 +767,6 @@ static const struct adsp_data slpi_resource_init = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
>  		.pas_id = 12,
> -		.has_aggre2_clk = true,
>  		.auto_boot = true,
>  		.proxy_pd_names = (char*[]){
>  			"ssc_cx",
> @@ -804,7 +781,6 @@ static const struct adsp_data sm8150_slpi_resource = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
>  		.pas_id = 12,
> -		.has_aggre2_clk = false,
>  		.auto_boot = true,
>  		.proxy_pd_names = (char*[]){
>  			"lcx",
> @@ -821,7 +797,6 @@ static const struct adsp_data sm8250_slpi_resource = {
>  	.crash_reason_smem = 424,
>  	.firmware_name = "slpi.mdt",
>  	.pas_id = 12,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"lcx",
> @@ -838,7 +813,6 @@ static const struct adsp_data sm8350_slpi_resource = {
>  	.crash_reason_smem = 424,
>  	.firmware_name = "slpi.mdt",
>  	.pas_id = 12,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"lcx",
> @@ -865,7 +839,6 @@ static const struct adsp_data sdx55_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> -	.has_aggre2_clk = false,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> -- 
> 2.34.3
> 
