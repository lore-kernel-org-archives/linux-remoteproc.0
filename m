Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773534;
	b=0ExdJZKRpvjZP4nTpxangaOyK9jSyRvDugKSFvUK0SF+B0rsN4ehw8+mLtLHfiUsCLqI
	 SL4/Sd5Qgmwlq7AkZOOQbzq0LBLQmyw7IjhgJ83eaikJNgl7widBG9bKPWURe35eHjV35
	 WhRbbjBqRsj0EFMbwbWxQ6LbN4FcSA6lxmk2dC+Sb+78PJvXUdZ3+VrVJz6+4O/dtlked
	 j7OPt6y7rdrEUGmBu72c9Kxmyt+3v8mgA4kKsoC+wpzePrnoxBXNoGQe710GSfVDc3LpU
	 +y4iht1GkQvF+AixvJ8vFi9kOXFVCkYSZT5vlbEqB/JDBDQhGZwG6wfqRubUMEfFG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
	b=jGIChH6orjzR39Rd52+lVjoXYy4XWj0cVdtdTXbLtZgewPpJPLrqu1HzkBP24cz3OtNn
	 owX9FoJy9OqsETvisNSPY4cMMrW2aqZa9L44rBZsiYR2D3cAtIBidT6fTvYUamCOlt2N5
	 fpcYKo/lTsGEckJPGVb/PUrjNjRajuXbn3HO3CxHJz+6SG8kH5bYgK8vt3kHIJJPAg9wL
	 inWl+KxEW99+G0AKFr24d8uEWRbFjnppNQ2UPsVABVuEv/8kiLDZq1WZQY3Z77IdGAjTx
	 /slemkeaT+4Iu7vYlWbPe35bx1ANpd5erHPbuxuzP8NgyvpQRqo0ZlQwYVfzgp1F13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFYXB7KP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Om9ISZoM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB837606A698
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB837606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFYXB7KP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Om9ISZoM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQw71197175
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=; b=FFYXB7KP8bTOV2BX
	lHqDSuLFy+ONvVxACTAfcO0CcPvghrqu7cQvU0hJAHg9izRSew5SHNQzgloU1tOt
	2ejmJYmLrByKMWSeaxUw4wR3RQHQMp7S03a0/34G+21mydxjgBKrsnjX1dMNjNU3
	mqqU1wfcLhX04/++MpJqONfGqLjQ9h0L7MhCyGqQZIxnugM7FEDhjmAhaWKEdsen
	DFNQB62BMjlqxaMO0Twx9+7tQGgx27NVUPqSuPBGfdKWc0BgsVJE7DxEeN0ZgGXE
	rUWTKabL5d9fZLwjmLDdh3lOqu1DZcML+B/hh+ynKod/01PQDsT7K7vVmGntxHzz
	VU42bw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8p82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:58:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0717e54b0so55995625ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773532; x=1796378332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=Om9ISZoM8xPlrkjpsFmOwEo76V768up4OJyPgSTqE2bfXov9FRnT3cWhWieHJgG7Vx
         c5BBRX2hNeannTjwOsDoqGjLiPFwThhxFaEDkHKzjfuzL9mnLMQ40vQMFfv/Jh5q/Q3/
         g+4LHpGKCurvBwEJ8wnUF1Mu5WKkGNHRafvfAuL+qHtMA05wHkXLr44qH1+q0r5bt7KI
         IMNRdp+D+/71FOvVSHrBwkWMHbVaqeH+rSlhHCxHhFeR+IvKrDCCQeRuQwvsd6QQUTPJ
         hqbuq/D+v1Al5LL3W15d0kU4Nnokj5LNQrDhRiN9jVy8c9fseZ3whAfY3qn7MDx0gQd+
         TPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773532; x=1796378332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=qRsy0xgccW8H8FDaT4Z3buDW63ylNgCsqceRdc1ElUo5OUtIc2AeTSx+F3F+773O++
         GGIgHdXDfTf9vUfu0FS/81L49jgvIgkdXZKxdRfSlm52IWVLzbmc0YKGbneblLvaK4nM
         2FOygNaslRNl8V+x/FtJGxRLZiyywbwQ3yAxfw26no8Hes6E08RV1IEefXcpkzCEMcKe
         7PzLjZ5GrDY9E4pG5tYSB3MvCATVUuAavjHhY/8Uc/8c5D9Pvjn6GpZr76zulTCVjjgf
         TYfVzpvXO0isDXH9SoDld9lwK1JpzI6pshl7TFr7d96Pp8q22ZIBCIKVhn8nB/Ez+Ee0
         K2cA==
X-Forwarded-Encrypted: i=1; AL+hErFi6ezwCY2VxJywYZ3yKKOJEBJOBdShpcwoiVg4NPhOXju1eiwWgEnjKxYCyDksw4+JgD2Qdt/vSRJDfkBXFvlN@vger.kernel.org
X-Gm-Message-State: APuU4Z+iwbbiMZwrUScHGaqpcDs4eFHO7NxGgTAXQw2DTNF4ukPGN6BE
	fAEXXSXODY4Y7S4Iwkh26TYho0GCR0DYUfJGHTRtbfxGlrXjawRl79dENfPTO3CpSM0ja4ZA/hr
	4fybIc96tmHdFRTQLyYC/stppfJHNy8fc7lmhLqmgAUCiY7vuiP5WTSAbClBZlQUKv2WAxR+J
X-Gm-Gg: AZFdTZfi7GXsHcO9P9Szz2NkffUMMM+xs/D5oDeskEajk4hWmFqViqFc0qTxOolv+A+
	Wakjnhlrz4nrrdUqMnr0xVPJIoya9rQetOGsk5F0SGDHdFu1lbld1p3wGQO2eRlwzYBbf+PABZN
	Wd1AsMq1GUxn2CaIP0HirELMIS8nrTonDNT9xkS/kgICZgQ8Gctnp2oB7lNibs2InN4oDjWna22
	Hi5hF9Qhkzqfv25sf7rmp4uAxc0+etxv4Gpm1I/i6lXDwooq0jTdWexX6XG2HqHAGGZRYnM0rvs
	zmcCh2OqKIzvKmeR/+WDAZ6DvmnXUGjrkFABQr/hgzK+RkADINMV5YAQEg+CJZBFBRhjQJ1MuCM
	xN7QQr93jzolAOEIBKx5V+IK/shs2T/iL9bdSEuY5XhR6DXFG2MCy9pApB3gwvyIgzRWK9OoTsI
	Tc/2LY
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897598a91.20.1795773531689;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897555a91.20.1795773531067;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm21547994a91.10.2026.11.27.01.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:58:50 -0800 (PST)
Message-ID: <8ec59e5f-c476-4721-91f7-7fd3fd1018f2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:28:39 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXzDRDR5GhyRLx
 uf//hfvyqhdviaAN/gCgY8QHszMoC3uAEt+bN7WgubaNwR/ssUt4Nq2Zkb7Vm8Z4cCDRjfqDzcG
 qT9AOo9jFqlY+QdJFS5K2czxFkKlfOtXsSXmC57jenQU1rlyoMCzGhSaHmgr5Ynlhl+yjQ3OmGi
 m6em4mynA4eFlmXmURCCzBUV73xP3XmoZxbm9TDIf5ZrsizytoCaa0hmFaf9Ej0J1gqw/UU7XtA
 MxMtLLXst8bgVobri0CDO/7UKflNRSI/5H2itn/2l6GXJ2IIImLapAU8TUmuD3l1Nhs2Frmnvss
 DUlogRXXj51tGDkt0j/lCuYUf8PqvmxmMSe5qL3d4i+dW2twNd5pnUR+659GEHhc4pQq8RD5Cat
 PQL4CWX0jLXcE5sPzfEZHB36tk/XPloge/bQZyFg/ZXRBqk2NfPH2xcRFQ/lOPTk25J1y/OAGzj
 kilFnbP1yWnCKeL3e/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX+RFQTytfHUGQ
 7AN6ExonzV5gBkhVJBBHTK0GCZPFKlDMhMebUXCmbmo4mHpDWwKu8SypthgaxH1yjmHbqyqxouA
 q94YgUhy0J32wmrITC+ZbTM6w5mDlEk=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09545c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qTQABE6tYUUe6KctvrYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: QlKtCzzrr-ZEFWIRcsIPrMI8BW-IzzHo
X-Proofpoint-ORIG-GUID: QlKtCzzrr-ZEFWIRcsIPrMI8BW-IzzHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039



On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> venus_load_fw() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
> for TrustZone authentication, which is the intended behaviour. However, a
> new qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Embed a struct qcom_pas_context in struct video_firmware and initialize
> it with qcom_pas_context_init() inside venus_load_fw() on each call.
> Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
> replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
> sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 93fa77f05834..84a0d4a8426c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/list.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -228,6 +229,7 @@ struct venus_core {
>  		size_t mapped_mem_size;
>  		phys_addr_t mem_phys;
>  		size_t mem_size;
> +		struct qcom_pas_context pas_ctx;
>  	} fw;
>  	struct mutex lock;
>  	struct list_head instances;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..704343e241dc 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  		goto err_release_fw;
>  	}
>  
> -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> -	if (!mem_va) {
> -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	if (core->use_tz)
> -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> -				    mem_va, *mem_phys, *mem_size, NULL);
> -	else
> +	if (core->use_tz) {
> +		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
> +				      *mem_phys, *mem_size);
> +		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
> +	} else {
> +		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> +		if (!mem_va) {
> +			dev_err(dev, "unable to map memory region %pa size %#zx\n",
> +				mem_phys, *mem_size);
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
>  					    *mem_phys, *mem_size, NULL);
> -
> -	memunmap(mem_va);
> +		memunmap(mem_va);
> +	}
>  err_release_fw:
>  	release_firmware(mdt);
>  	return ret;
> @@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  

Thanks for addressing the earlier comments.

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
