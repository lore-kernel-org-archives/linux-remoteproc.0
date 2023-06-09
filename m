Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408EBC7EE2F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jun 2023 15:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238744AbjFIPHK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbjFIPHH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Jun 2023 11:07:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9667210C
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jun 2023 08:07:05 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso2374606e87.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Jun 2023 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686323224; x=1688915224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HRF2b1CvR2hajy1IOanokuAFQMVHjoB8ThV/p26Mgo=;
        b=f1PxIDpuX/zlqFfWw+blXBSi9DeKzHcZsnncbPmp9adn2niqylXij/tJltEQSZatdt
         Lsl7s4HX/edkwJrU2V14/47oNsmDYTIx7JGn/AYXNsXsrQScpuLRLlcl8zJS2Hocs40C
         VDMzuZ1YBYGfXVQz9rtcVLe6CEl7DE099a5fhu9VVW2OcVCrNIc5AakezLanqhoZENv8
         9MRvR9QD8LwCxHSZFg8qP+L7pKYntsUZy30z6bu+uQ2e0zrJ8bYOLRXUGgzaXy0H+0bD
         WnwFreMG69jOZojwbQ6ZipGcGxZZtNE2wEzzbFTJRYbOnv1yV+DitQxj//8v4SYvMFGc
         sDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323224; x=1688915224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HRF2b1CvR2hajy1IOanokuAFQMVHjoB8ThV/p26Mgo=;
        b=WWKhk4gg2Xssr5cyd+ZUwRKf5HTr6FgrKSV3dE3sZkPiIj/u7hHM3OrftJgR/qiHhg
         HhyM4o3P/4VlhbkD+SmLhIKxsssw01ze6VQNRsdOd8rMJRsBpeIhIAhsMygLxhcrXhLL
         uOcp9CdteSy0yGJo5OnonPr2OL8QqnYkNsfZqxT3xE/4Y9UtjeVDqdRazjktJkOD3CFa
         GPXXldcH8GPhXFcru3ZRIKYZLgnDQD6i4Qwp0l53qyjuZ8kKrAJqNqqeJOcIlp6tU7wC
         WC1MjjoFygyG7iSzbKjOsVdbcfZrvmwzybnOfwST1gtosc80fJ3P11Zy8qGMfok9nJjE
         DmpQ==
X-Gm-Message-State: AC+VfDwGhZYGdfrnpJvRbQ+BmR33DuCHbAb0Pfg4MNlxBuqBsM1fqC0u
        eLMKTvVHm+GCVYAfBfdPDOqIcA==
X-Google-Smtp-Source: ACHHUZ7SHhOs7l2r+XB9S3ahIrZZvIAkME/tcLdio2OOfNuWXJq5cfITXW3St68pwNFU5EN8sFje/g==
X-Received: by 2002:ac2:4643:0:b0:4f4:af2c:97e with SMTP id s3-20020ac24643000000b004f4af2c097emr1110419lfo.11.1686323224152;
        Fri, 09 Jun 2023 08:07:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id y8-20020a197508000000b004f3b4a9a60esm581582lfe.106.2023.06.09.08.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:07:03 -0700 (PDT)
Message-ID: <6b55b3f6-6424-4d7c-4782-d2de41df1f85@linaro.org>
Date:   Fri, 9 Jun 2023 17:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 07/12] rpmsg: qcom_smd: Use qcom_smem_is_available()
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v2-0-56a4a00c8260@gerhold.net>
 <20230531-rpm-rproc-v2-7-56a4a00c8260@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v2-7-56a4a00c8260@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 8.06.2023 09:10, Stephan Gerhold wrote:
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
> 
