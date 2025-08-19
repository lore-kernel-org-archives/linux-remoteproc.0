Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5722A4D5
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603838; cv=none; b=cBQpXuICbV4h2T2YRAvuOVWw3xE8uv4gCEWxhP5BCVkzmrS9NFlK9j9myDzn0rWvcWUk2OQZ9u0V8IzZ69ZC80UB3SVa0yMyWedGxCZbA006cNh2h77cp3l8x1d1Upqn9701Yb5iPojCz+pdKyCD/u7lKlyv1vWPvyeMs0Jp5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603838; c=relaxed/simple;
	bh=MZq6in0uqbFk6siWtSMp10S4fJOCkcSAugRfXPm9K6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tROIbmi8E//6UtJU6/fyTvKHru4Xcq7lNLmloY0g8NyqFnnH/SJIi+NlV+8Jzfik02+MYK6ZVqmEJjxK33t8JNSq4a+5KYFqvN2e5kkvlNc0pjoeEHpR65rJszitu/HUwtvo0urfsGUpdYpHvGXPKrDaZ3Pn5NZwH1jOjXWVKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfWhymI5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfWhymI5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90g2e027092
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+8vWBiULpJolPr/U+7njZK2A
	95NCna7gY9cskHOeiUs=; b=GfWhymI5abg2voLq9FYnLGKrfZ59WvlfU3IHWtbL
	DL4GyuJZo9nlz7GcBw9xmyyDdPoDPGTpONIf0Z/BUQfLUYC5RXPW9uOa1tjHz+70
	PzWgU/iFbhTLifaV9o/fZf0wJjR+SRofjbxdahzcZY3QT2i1W+RMpDss8/k9is1z
	W9WWgq6YVZx5FsStj741f4wJBomjLGdEBUS1z2/uYvPIJJePMAq/WyOowTzTEHFa
	ezuitO2LyTk96PBygXqgThcy4pM4SlZlJtCBtjA75s4XgDaE3rp3kXWPuLNrgeN+
	3sAygFDkqFzu6qFMjmEGiaFuR90z3r5tbsddCDiu04dPCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjygbwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:43:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ba7aa11c2so83955406d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603835; x=1756208635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8vWBiULpJolPr/U+7njZK2A95NCna7gY9cskHOeiUs=;
        b=RJ69jEOKf4WD72984QpYBsDdh/+noQp+xE87USl6aTj+MrboZdPRzF3XU/NBdzyApu
         N/iO6irZzEZAz+5ggUzIZJHPKj41rIcMsR03J760qlUV10bB4B2Rlb12aamu2g8PxkL3
         lwOAaxLBM4dhyiwRkgCCz8qTl8HrKrsyKpHeIbkiSkT3ZNzTpi44XlwZ9ssgK4at5Cze
         yyCvQ1zIttO/xwFdf9i9WBixFS5S/1aa5Cmy84u2WUIRsj3AX+F3l8CNX9DxGf0mK6Oq
         oxdaDL4KYHjuJMkmjsctWtmVvYAM4SUVqpnCyF2QvsItGqm7ix/MlwhRw+nuHkhcTH0C
         c4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW4fpNo/BtFtk0BXs/j7OQe0zd+wKjmJAcVvI2L3xnJVyKW53St0bF0YWHKr5atr2W2UjZY8XP0NFe9OQZO1q9t@vger.kernel.org
X-Gm-Message-State: AOJu0YzvmdZJzH5bzAnJ62jd3M1LBJKRGc8QcGtGjcKav5d6FeujTBxS
	NZFaTTCWJUx/wsLrGvyOZYdZzTZ+I9OuUy8vgqbwy2PT/BDbCoqApxcsEfj162J7DTakUmHR1W8
	mWzf6lVaol6NIJi6eIYzfZYOiyVrwGpOwEGDuepkZLidjd2uZRzrxirAAyRlbsfIc3XxGRKvi
X-Gm-Gg: ASbGncujrCmjpketE9RNhFf4satVLxlc8XhdE/KOnKrDVkz5a8tT2wkvIatVZDTrgv/
	P2Aa584lr5KvG8+PRrgb+B8KdSD9ohh3ycJWRSis3O/3PNwZDropDfYxTEbqJ69W3hYU4OeSoUu
	KfN4G9AXDkCcwP6nWRTJcSw9I23tT1Nm3pXTpgyBiwOM8cKxDH7rr56nO0uuK/KvPpMfo1KFFlE
	xG8SiMd17TYo5phSZFsKnT9HeTsvNHhgVYm46L1rN+HB5313qUGqBTXRhH+PXoQDrzUb00NQhNk
	hbeb7WGr6o8+XZbRXAUDustZzTGPrS+uBw+UHv/YAyHC7UvumefmU+0BtU5qF7bx2I0Gg2SPLH+
	gnc0J7O+iXSOWF9UMNJY6i1Mff/t81JjlBSKyd53Mc/6awc8J2HjU
X-Received: by 2002:ad4:574c:0:b0:70d:6df4:1b18 with SMTP id 6a1803df08f44-70d6df41dedmr7395626d6.53.1755603834940;
        Tue, 19 Aug 2025 04:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdEAbrvmCf8s99TRcl01OEc0UkCWu0Hn/3+yUIeIHzpdQF7AdcBOMjp+j9PEumq6ST5aLn6Q==
X-Received: by 2002:ad4:574c:0:b0:70d:6df4:1b18 with SMTP id 6a1803df08f44-70d6df41dedmr7395186d6.53.1755603834173;
        Tue, 19 Aug 2025 04:43:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a60452bsm22810561fa.46.2025.08.19.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:43:53 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:43:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on
 X1E
Message-ID: <ygygwhw4whioqdxp6otiarmcmzhm7mblaq2lae2752323lqysy@yit6cg5fe6sz>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-3-de92198f23c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-3-de92198f23c7@linaro.org>
X-Proofpoint-ORIG-GUID: eG0iEF6pL8hClus1blI9tacy5h83XdrI
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4637b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K6hLqdUI4GmysVbN4VsA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eG0iEF6pL8hClus1blI9tacy5h83XdrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX/J4pIeo9Sh7Z
 A9XN9E109T7JEi8aUzJqnToa29FPN4y7Iq3i9jZn/dM55LtbPvET9ZRaFPMGDtI6FHFtYn5eyRf
 sHXgVREauy7Jh+JfRAOiS2mByMlD1dReKSIBAud+JFhFZQpPvyKjK37LTXA9vCBZcVU6JgxK8Jn
 75fTIXo5VVSVh81SsCtZz97enya1oABscUY9zNnUIzT/j3WYhpzE3dPIQGNyZ35SGViUA+0yN0m
 0N/US35RYAjB5lpXzkwN3T2/TTCMWf4yINtt0oBku76wDrvuWm8/f8/LfcFgpEcU6bjPHg+H+mx
 w6OGM5SPfV/WYXejovsU5sdWPEjK/17j8UJErcdVmNEqXBKuGO1ybgCtu5BLvdC8z2l+AFNICK2
 nE7A7alP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On Tue, Aug 19, 2025 at 01:08:04PM +0200, Stephan Gerhold wrote:
> The ADSP firmware on X1E has separate firmware binaries for the main
> firmware and the DTB. The same applies for the "lite" firmware loaded by
> the boot firmware.
> 
> When preparing to load the new ADSP firmware we shutdown the lite_pas_id
> for the main firmware, but we don't shutdown the corresponding lite pas_id
> for the DTB. The fact that we're leaving it "running" forever becomes
> obvious if you try to reuse (or just access) the memory region used by the
> "lite" firmware: The &adsp_boot_mem is accessible, but accessing the
> &adsp_boot_dtb_mem results in a crash.
> 
> We don't support reusing the memory regions currently, but nevertheless we
> should not keep part of the lite firmware running. Fix this by adding the
> lite_dtb_pas_id and shutting it down as well.
> 
> We don't have a way to detect if the lite firmware is actually running yet,
> so ignore the return status of qcom_scm_pas_shutdown() for now. This was
> already the case before, the assignment to "ret" was not used anywhere.
> 
> Fixes: 62210f7509e1 ("remoteproc: qcom_q6v5_pas: Unload lite firmware on ADSP")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 02e29171cbbee2d305827365ef7d2241b6eb786b..6faedae8d32ef6c3c2071975f2f1e37a9ffd8abe 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -42,6 +42,7 @@ struct qcom_pas_data {
>  	int pas_id;
>  	int dtb_pas_id;
>  	int lite_pas_id;
> +	int lite_dtb_pas_id;
>  	unsigned int minidump_id;
>  	bool auto_boot;
>  	bool decrypt_shutdown;
> @@ -80,6 +81,7 @@ struct qcom_pas {
>  	int pas_id;
>  	int dtb_pas_id;
>  	int lite_pas_id;
> +	int lite_dtb_pas_id;
>  	unsigned int minidump_id;
>  	int crash_reason_smem;
>  	unsigned int smem_host_id;
> @@ -225,7 +227,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	pas->firmware = fw;
>  
>  	if (pas->lite_pas_id)
> -		ret = qcom_scm_pas_shutdown(pas->lite_pas_id);
> +		qcom_scm_pas_shutdown(pas->lite_pas_id);

Unrelated change. With it being split to a separate commit:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +	if (pas->lite_dtb_pas_id)
> +		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>  
>  	if (pas->dtb_pas_id) {
>  		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> @@ -722,6 +726,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->minidump_id = desc->minidump_id;
>  	pas->pas_id = desc->pas_id;
>  	pas->lite_pas_id = desc->lite_pas_id;
> +	pas->lite_dtb_pas_id = desc->lite_dtb_pas_id;
>  	pas->info_name = desc->sysmon_name;
>  	pas->smem_host_id = desc->smem_host_id;
>  	pas->decrypt_shutdown = desc->decrypt_shutdown;
> @@ -1085,6 +1090,7 @@ static const struct qcom_pas_data x1e80100_adsp_resource = {
>  	.pas_id = 1,
>  	.dtb_pas_id = 0x24,
>  	.lite_pas_id = 0x1f,
> +	.lite_dtb_pas_id = 0x29,
>  	.minidump_id = 5,
>  	.auto_boot = true,
>  	.proxy_pd_names = (char*[]){
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
