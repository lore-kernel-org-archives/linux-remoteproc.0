Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFA6C77B73
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Jun 2023 18:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjFES4y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Jun 2023 14:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbjFES4u (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Jun 2023 14:56:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15560EC
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 11:56:49 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f6170b1486so3852020e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685991407; x=1688583407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zf9IQLOk9qUiw4+eKsxED5sbQsuv3zgHnrekOBoQCZY=;
        b=dD0uqtWPTZYJ805B0ICMKkvEA/I3vIhmdEkIg15nHwOFAY0YhO2rP5/t8XOZ0W7Kr/
         h1E+oAi9/3qjR7k+XaKMI6zhD9aEVA+9kMujNNEbc4ra6R75mFcX4cBXnWnzs9cDU+5d
         k1srCr1L2rSc3y8utqLQfA78KU6cUZvyyVdW1fKW4YgUMFfzKuHGqW6pFuBqyliLqhoQ
         of0XHgyVUTfEBUz/FPK2F+BP/GCkKBQlgofJwncTqNv0HGhBaF/lFCkwYFKepUYeeLCk
         q44xjvcSL5uABmMC7Y3MihiWpTmW2NXL7bl9H5BRKqpuri5JPAt7i/vf8KBElRcINCbS
         n8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685991407; x=1688583407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf9IQLOk9qUiw4+eKsxED5sbQsuv3zgHnrekOBoQCZY=;
        b=Nu/9/lE1ETlqLyNdLUG25FV9/fN9y8Wb4e3bsUlCa9zz2Po+Lk2beqhfDpe12mwZID
         InhjgL0c1H1iGEJhwJRC/95LySLrTTa6URN5zDHqqtqW4/C55/M5Lt9pr1N3nK7IVOUQ
         Mij6EBIQ++CQnhLKLgAfqEKEbgf3enalYUOeg55TFU/uPwO9IF4GgPrA/DFkO2gS0AHm
         WAd1I0VH5GIA+HckypOxOpCPr6VCmzCc+kr9S0IGU2/z5JzBtnqOG2/+4OX9/o+zGmZd
         pa8iVaiX91bL9+2b6rj5Hh8BJolNI+ey5BaVK1ThmQ+o+u53y8+JuWIW0hjjz1uOfP+f
         9hMQ==
X-Gm-Message-State: AC+VfDwhmkpV8L0xmff65yyEw4xvn/haSIzsovHJldWzw2dnXBhsQ7gQ
        X4RSvMjYge2i6ZuFDdwHCRCZzg==
X-Google-Smtp-Source: ACHHUZ6RcPsWNJ5Yda66n5r6s3wlCCAlW5igzqj+bL4sDG4u5ngM7yYBkHa7BDXWujHyaxQ+PHzLPg==
X-Received: by 2002:a05:6512:6cc:b0:4f3:b55d:f9cc with SMTP id u12-20020a05651206cc00b004f3b55df9ccmr3694506lff.20.1685991407371;
        Mon, 05 Jun 2023 11:56:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25ff0000000b004b5979f9ba8sm1202377lfg.210.2023.06.05.11.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 11:56:46 -0700 (PDT)
Message-ID: <0f48649e-27d6-97f7-98b8-fe10b99d0236@linaro.org>
Date:   Mon, 5 Jun 2023 20:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 09/14] rpmsg: qcom_smd: Use qcom_smem_is_available()
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
 <20230531-rpm-rproc-v1-9-e0a3b6de1f14@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-9-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5.06.2023 09:08, Stephan Gerhold wrote:
> Rather than looking up a dummy item from SMEM, use the new
> qcom_smem_is_available() function to make the code more clear
> (and reduce the overhead slightly).
> 
> Add the same check to qcom_smd_register_edge() as well to ensure that
> it only succeeds if SMEM is already available - if a driver calls the
> function and SMEM is not available yet then the initial state will be
> read incorrectly and the RPMSG devices might never become available.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/rpmsg/qcom_smd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 7b9c298aa491..43f601c84b4f 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1479,6 +1479,9 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  	struct qcom_smd_edge *edge;
>  	int ret;
>  
> +	if (!qcom_smem_is_available())
> +		return ERR_PTR(-EPROBE_DEFER);
> +
>  	edge = kzalloc(sizeof(*edge), GFP_KERNEL);
>  	if (!edge)
>  		return ERR_PTR(-ENOMEM);
> @@ -1553,12 +1556,9 @@ EXPORT_SYMBOL(qcom_smd_unregister_edge);
>  static int qcom_smd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node;
> -	void *p;
>  
> -	/* Wait for smem */
> -	p = qcom_smem_get(QCOM_SMEM_HOST_ANY, smem_items[0].alloc_tbl_id, NULL);
> -	if (PTR_ERR(p) == -EPROBE_DEFER)
> -		return PTR_ERR(p);
> +	if (!qcom_smem_is_available())
> +		return -EPROBE_DEFER;
>  
>  	for_each_available_child_of_node(pdev->dev.of_node, node)
>  		qcom_smd_register_edge(&pdev->dev, node);
Hm.. we're not checking the return value here, at all.. Perhaps that
could be improved and we could only check for smem presence inside
qcom_smd_register_edge()?

Konrad
> 
