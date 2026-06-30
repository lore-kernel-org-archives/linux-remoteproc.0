Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB53E2AD6
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806152; cv=none; b=BhkljN8K/Pg/Ch312vNT1eGrUaJqDmI2CD9M0GBrHCYJMUin3K9TwOqcGUrWDmA1S/9Y+3evSZAug8WTgbxYkajSsbhNv7Aeim/be94eqTAxn1lVDlYUwWrJ0gRucPVJNNK8u8XXLFEQtKeTyQQczZoNZ8yiHQ83WAfHPzt+f2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806152; c=relaxed/simple;
	bh=cRykOdJcg82LY/zQAD7pq4ibR7qbi1H6EcAU8FKPdFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CecrSDn53VyejXb8W3x/ZQG6uzk24hbohiN7BiWM9ZrL3i+LKg1WxMN0EVyH2kgqpDpBbR5WbN4zhy4+VDxCJ6+I+Z/6Qokazu7gIpOl8MRpc9bUgnU1QgvlgUw5ZtG/IvgRFND4SbzDofTPFXkLf2I9Z+tngIEfd7U0zbLkyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEKrKVrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLacls/R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEKrKVrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLacls/R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Cdd31074123
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mqpNY3U/BBW/1jq7tUqFwqPx
	2Jgckwa966PpuubyQb4=; b=NEKrKVrOvnmAJZFZpqtVsPhOi8xUrMDGZH2JBrza
	q/nnn5B5u2HL6I7OtB7KwWe0+HftoNYWg93TFf9B/JHmBWcAAKe+/bBEomMGzsop
	ih0l2aHP/TgRU1teiKwmiS128MO1f+LbUudj/RlCoBfD5azIkMWGdr7dIJyGRwKs
	iBAr1MGHu+wM/Ddmuxm+GfkJibRGUCBCRg7h/izAbpx6unFMlFDAa9QVMtWItqug
	NDtXsNLtoGG2SGdKJEniib29uivKu8BOWcGs5zbt4S8dHsypMWfvqKcqipzBVexs
	eZKBiGnnljFIMeLU5xmQm6b/20O26TxqXYUF/oxAa3pJDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k296h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:55:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13b2bede3d4so462029c88.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782806149; x=1783410949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqpNY3U/BBW/1jq7tUqFwqPx2Jgckwa966PpuubyQb4=;
        b=bLacls/R4qVVttXVMgFlPvrZfp1uSieL88bFdvmXTvCO90UYH5RPvEC9n9KqvyBieD
         jG3WyryMVjiR0AtVg+6KjVyiyhhPxYXTHq7z3ice9FolNKYWxIagqAPoHiMYmSd62N9y
         hO+CBrJ2xjXXhnlriX8xZ/dmbL/NSHTRtUQxmIapfg3sf+8ZQ1o8xHcIPJxrqOO/+WNF
         v1dzDXik8Fh4eMHHMPCMamNSQ3OwnYJ+SrHkd0srX9x5OOB5BYBWyykJ5rW64eQP0prf
         Dm/8GCYowrYbivFgB8gePdTxPeAyI3Ue/GYqgLv3Z7w5+fPKAMY97MoER5vxSckrL65/
         X6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806149; x=1783410949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqpNY3U/BBW/1jq7tUqFwqPx2Jgckwa966PpuubyQb4=;
        b=cailOM2N8vPZiW7v18HsWmHfbtQCio9G9d6lV1NUZGWrcaYVFEki53K76t8TGriElo
         RVJsUzH2drOSDA4D36Hn6bRQATa4+cYsFOm2Yey06ykZN1MZpqGD0oG9IXs0/60HEWRO
         z+pZrhOKlpC7eugMj+Sef+4mMHexg8MDRMMi52nfy/n9bAto4352Bpt8xYwjJSLbFfWV
         37x6iH6Vor/GCB7J9MPGHoefsQCBuEWzxvdj3smPBNh2l5LZZ5Kh//cxteaDqVFByHEh
         1Q9GZENGomdAwAwZ/EmMxqQIsVJve1EYJZKXKGNGn77Uj70cp5eoim5iBBMcZVNfEIBS
         BXXg==
X-Forwarded-Encrypted: i=1; AFNElJ8lDIaep7m1lK7uF2Fju6rNvLjYNuuek3f2BWDwKP0Q/yjBgYwukQdKdZdKCPXkB9DTf6jiZHy0WPaZX5FXCWXv@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhKTndLtYnAPEur2OeygEfBUClYXj+K5udXkilqdfx5WNOTNv
	NRHYYO8vRyh8hkmoSwaLNifBVM2kp+SevgDO0T8ys+54481wgXRwe6UoCQ/viymL1pqtA2eJ3Dq
	Tl4cGI+1Hr+XXYMv1zNE53+fRb44F5us0apQkaZivJ/h5T8ZFh+L27Fr1M4qH8eL8N3/fQK+V
X-Gm-Gg: AfdE7cnEUKQsGRj8VESJn6IArHmQ0raatNIboNlOHQNpA/CAJNFr2nxvICbAf8n5BmG
	o0v3fd7P2FT4pBgPQ1Fi5/Z0U/6wRgZDx7rMxAB/HsnhsJl0pkHDkfQtj6ST6xFRlhavBmaijd9
	mISrnHutsZ+KcobFY5C0xDDIaAApZRMr7b8DwNEIErbyApl+3X9CMuuzfWAoMNT1Hngu2aoRsLU
	/Rlk5Kl29axpKGti/2emPlPqVKuqy/crRnZi0/6G17gG3MpMK7bJ5ajo+AMeCsNKVZaw0+OetuV
	c5UjtF4zUTWBcCSxDu4IWIybILcvo0LplIjdwPPyZYXThuQhMZyFwUXUox/X04jfZjtlY6dpxNE
	BUdevUaPiCbWm3Ph1FM0FbplmBEe+aew+tEr46g==
X-Received: by 2002:a05:7022:f8c:b0:13b:1bd2:389d with SMTP id a92af1059eb24-13b2e3438cdmr517203c88.24.1782806149208;
        Tue, 30 Jun 2026 00:55:49 -0700 (PDT)
X-Received: by 2002:a05:7022:f8c:b0:13b:1bd2:389d with SMTP id a92af1059eb24-13b2e3438cdmr517169c88.24.1782806148279;
        Tue, 30 Jun 2026 00:55:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba8dsm5647940c88.13.2026.06.30.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:55:47 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:25:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
Message-ID: <20260630075542.lipjayqvrcgepx7z@hu-mojha-hyd.qualcomm.com>
References: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
 <20260624175335.22799-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624175335.22799-1-saileshnandanavanam@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfXwwYxaUFwhrXv
 3lrBMdeYVjDw2WQXgwG/syImz1XsE9bqZDmdyP96wLPE+SA/dMaagXF13OMocUvR9ClTdI/GrZ2
 Zjp0VI4BuS/EIKBgbLivsRKSRLZ6ftM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX4cWGOqzvaE36
 VJw8hQmsTYW4AybpvQ6J0X+U0vbvg8sHSEdx1+R/4b87eQWytfjVKmMK4EeMNpy3FLnEKP7ZCX3
 7Dzc2lwud16sAQMhH08mnIfuUnCnfyuLbZ81BDSMzmO+0rJ8rMM6AKYx50j5AcV2T7ZDsMf03M+
 7y2b/uHgmiWLCMr6UASOp0gLSb/qWOFB8tMRWS887pQoJSline/DsfFw3ZMlA6l9lDY6JuJ/GF9
 FNKm5IaRpFD3wijbz2z4JXen6fecuEMAHOJWsERFbqYqfa+jXDdm+mWpcrk16tZt3TZ+kbgAhLk
 DzOlpoVAfyu50Iu+h6CvdqIXjBBP1EUZ/M0/0nOodXpyoAk8FGwAB1AONkqlydDyysIu66XkJi6
 0TfYXqgg4Qr/6fXo+2ZMpGUqhAr5zrNLD5OCrmSIIDDWiX2DTcyKrKnr21Ik/kFDpHTPl8rvnCC
 kIhQLm3pTzKQHLQH38w==
X-Proofpoint-ORIG-GUID: IaOYGbWyD6jq9Bmf3_QJB9xCv5vFURRL
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a437686 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=_ByhrIy0lgGYLjqKynUA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: IaOYGbWyD6jq9Bmf3_QJB9xCv5vFURRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300069

On Wed, Jun 24, 2026 at 11:23:35PM +0530, Sailesh Nandanavanam wrote:
> DTB co-firmware was previously requested and loaded in
> qcom_pas_load(), but its lifetime did not match the actual
> start/stop lifecycle of the remoteproc. As a result, the firmware
> reference could be retained across restart cycles, leading to a
> leak for each successful boot.
> 
> Additionally, if qcom_pas_start() failed after loading the DTB
> firmware, the remoteproc core would not invoke .stop(), leaving
> no opportunity to release the associated firmware reference.
> 
> Fix this by moving DTB firmware request and loading into
> qcom_pas_start(), so that its lifetime is strictly tied to the
> remoteproc start sequence.
> 
> Update qcom_pas_start() to ensure proper cleanup on all paths:
> - release PAS metadata on failure
> - release DTB firmware on both success and failure paths
> - unmap DTB carveout where applicable
> 
> Remove DTB firmware handling from qcom_pas_load(), as it does not
> match the correct ownership and lifecycle model.
> 
> With this change, request_firmware() and release_firmware() are
> properly paired within the start path, avoiding leaks and ensuring
> consistent behavior across restart and failure scenarios.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>

Revision of the patch should be sent separately and not as reply
of the earlier revision.


> ---
> v2:
> - Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
> - Fix firmware reference leak across restart cycles
> - Handle start() failure paths where .stop() is not invoked
> - Ensure firmware is released on all success and failure paths
> - Remove DTB handling from load() and drop release from stop()
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 54 ++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..090f1f09dba3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	if (pas->lite_dtb_pas_id)
>  		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>  
> -	if (pas->dtb_pas_id) {
> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> -		if (ret) {
> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> -				pas->dtb_firmware_name, ret);
> -			return ret;
> -		}
> -
> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> -					pas->dtb_firmware_name, pas->dtb_mem_region,
> -					&pas->dtb_mem_reloc);
> -		if (ret)
> -			goto release_dtb_metadata;
> -	}
> -
>  	return 0;
> -
> -release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -	release_firmware(pas->dtb_firmware);
> -
> -	return ret;
>  }
>  
>  static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> @@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
>  	struct qcom_pas *pas = rproc->priv;
>  	int ret;
>  
> +	if (pas->dtb_pas_id) {
> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> +		if (ret) {
> +			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> +					pas->dtb_firmware_name, ret);

Check the align of the line.


> +			return ret;
> +		}
> +
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> +				pas->dtb_firmware_name, pas->dtb_mem_region,
> +				&pas->dtb_mem_reloc);

Here, as well.

> +		if (ret)
> +			goto release_dtb_metadata;
> +	}
> +
>  	ret = qcom_q6v5_prepare(&pas->q6v5);
>  	if (ret)
> -		return ret;
> +		goto release_dtb_metadata;
>  
>  	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  	if (ret < 0)
> @@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
>  
> +	if (pas->dtb_firmware) {
> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
> +	}

you can put this under check pas->dtb_pas_id which is already
there.

> +
>  	return 0;
>  
>  unmap_carveout:
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> -	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
>  	if (pas->dtb_pas_id)
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> @@ -376,6 +372,14 @@ static int qcom_pas_start(struct rproc *rproc)
>  	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  disable_irqs:
>  	qcom_q6v5_unprepare(&pas->q6v5);
> +release_dtb_metadata:
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +release_dtb_firmware:

who is the user of this label ?


> +	if (pas->dtb_firmware) {

dtb_pas_id check should be fine here..


> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
> +	}
>  
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
