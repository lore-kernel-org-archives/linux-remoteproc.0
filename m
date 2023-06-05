Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE41C7EE25
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Jun 2023 18:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjFEStV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Jun 2023 14:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjFEStT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Jun 2023 14:49:19 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A4CF1
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 11:49:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f5f728c4aaso5801294e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685990955; x=1688582955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS7R8Iw26U2hBPhTa4MZJ2uQUjp12WGBrNfWAr/A1BY=;
        b=v14FLESgzRLJ7jJiMOxQzWE1HaUNvpUIwxALr1UpG0kEN6Qsj4URQP3OIZCKD4kz/3
         c25IqisDh9wUCeQWLdjGa8CXnhY5bVP+a0VR5s41lDORwJChQBIZlpgKKOzYyKMxz3Du
         b4oc8feOXJGz3faQWAmSTDXfgAHu++s9+yMdebAcmlWsSJbv8R4bM+2vmqxax1PjnJlW
         ++pCEDVd5lgDMXqxlGNV/ZuZQO0JfjyVtuVByVjtIJ+/CmsO9ZEEYHRl7yr6xFe/goBP
         H+oSKrVkvG+8ZRKIyoJqNGc5b6M0uaNH8uvqZ9iWhlajZCKKl6bDTzgwI0VYjEXqk8iu
         1V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685990955; x=1688582955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eS7R8Iw26U2hBPhTa4MZJ2uQUjp12WGBrNfWAr/A1BY=;
        b=YVZeY9OLhrsymgzvgQkqZtn+Krglas3fMJaHyvTmbU3YwYnM/5OPhtxLv2s/Qg4efc
         xqVuRyl2T/pjIwPetNh1BdW56XKdXR1WXUZD8DhHA68UkkbtS2ZznMVA198zwdb2JqSz
         kmiwOKqXy9SwAdpU72YOKyxvo6QFHXra9JgLDYepF2Zpx7euEO7ZO908R3tMWVIow1cL
         GH1MDZvqr0maeM9hy+J0gX5eKUoVFtr6EBWpCq1lgob88yGn3bGwoRKO79kA5tjHCuEV
         C5hokrbCYZoZheIyKMrhEOLlqSyxHQhPf0yMLUqdwXXfCMll7CesWDJ3RvdZQUWIrhD1
         EyAQ==
X-Gm-Message-State: AC+VfDzISb+vE3nCHL2BGoRT/oiCpkPaHdl9tjoHPuVkZuMK8RPkCotQ
        texezUkqvZZmYbUYpoVP4R7w/g==
X-Google-Smtp-Source: ACHHUZ66SeEy8dldCqgvYUjjpe+Gv06VM9DmlXAk6TNxjzYlDvyAVS8UKqFdJrPs328lAR8pVrFpOg==
X-Received: by 2002:ac2:4353:0:b0:4f3:77f9:2bbe with SMTP id o19-20020ac24353000000b004f377f92bbemr3810557lfl.3.1685990955422;
        Mon, 05 Jun 2023 11:49:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id a9-20020a056512020900b004f62e33f343sm225120lfo.109.2023.06.05.11.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 11:49:14 -0700 (PDT)
Message-ID: <84c94ba5-fee4-c37a-9900-f9a1ad589c33@linaro.org>
Date:   Mon, 5 Jun 2023 20:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 04/14] soc: qcom: smd-rpm: Match rpmsg channel instead of
 compatible
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-4-e0a3b6de1f14@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-4-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5.06.2023 09:08, Stephan Gerhold wrote:
> There is an ever growing list of compatibles in the smd-rpm.c driver.
> A fallback compatible would help here but would still require keeping
> the current list around for backwards compatibility.
> 
> As an alternative, let's switch the driver to match the rpmsg_device_id
> instead, which is always "rpm_requests" on all platforms. Add a check
> to ensure that there is a device tree node defined for the device since
> otherwise the of_platform_populate() call will operate on the root node (/).
> 
> Similar approaches with matching rpmsg_device_id are already used in
> qcom_sysmon, qcom_glink_ssr, qrtr, and rpmsg_wwan_ctrl.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # SM6375 (G-Link)
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/smd-rpm.c | 35 +++++++++--------------------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 0c1aa809cc4e..13d8c52330d0 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -199,6 +199,9 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
>  	struct qcom_smd_rpm *rpm;
>  	int ret;
>  
> +	if (!rpdev->dev.of_node)
> +		return -EINVAL;
> +
>  	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
>  	if (!rpm)
>  		return -ENOMEM;
> @@ -230,38 +233,18 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
>  	of_platform_depopulate(&rpdev->dev);
>  }
>  
> -static const struct of_device_id qcom_smd_rpm_of_match[] = {
> -	{ .compatible = "qcom,rpm-apq8084" },
> -	{ .compatible = "qcom,rpm-ipq6018" },
> -	{ .compatible = "qcom,rpm-ipq9574" },
> -	{ .compatible = "qcom,rpm-msm8226" },
> -	{ .compatible = "qcom,rpm-msm8909" },
> -	{ .compatible = "qcom,rpm-msm8916" },
> -	{ .compatible = "qcom,rpm-msm8936" },
> -	{ .compatible = "qcom,rpm-msm8953" },
> -	{ .compatible = "qcom,rpm-msm8974" },
> -	{ .compatible = "qcom,rpm-msm8976" },
> -	{ .compatible = "qcom,rpm-msm8994" },
> -	{ .compatible = "qcom,rpm-msm8996" },
> -	{ .compatible = "qcom,rpm-msm8998" },
> -	{ .compatible = "qcom,rpm-sdm660" },
> -	{ .compatible = "qcom,rpm-sm6115" },
> -	{ .compatible = "qcom,rpm-sm6125" },
> -	{ .compatible = "qcom,rpm-sm6375" },
> -	{ .compatible = "qcom,rpm-qcm2290" },
> -	{ .compatible = "qcom,rpm-qcs404" },
> -	{}
> +static const struct rpmsg_device_id qcom_smd_rpm_id_table[] = {
> +	{ .name = "rpm_requests", },
> +	{ /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, qcom_smd_rpm_of_match);
> +MODULE_DEVICE_TABLE(rpmsg, qcom_smd_rpm_id_table);
>  
>  static struct rpmsg_driver qcom_smd_rpm_driver = {
>  	.probe = qcom_smd_rpm_probe,
>  	.remove = qcom_smd_rpm_remove,
>  	.callback = qcom_smd_rpm_callback,
> -	.drv  = {
> -		.name  = "qcom_smd_rpm",
> -		.of_match_table = qcom_smd_rpm_of_match,
> -	},
> +	.id_table = qcom_smd_rpm_id_table,
> +	.drv.name = "qcom_smd_rpm",
>  };
>  
>  static int __init qcom_smd_rpm_init(void)
> 
