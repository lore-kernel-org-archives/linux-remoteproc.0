Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3943DA55
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488047; cv=none; b=juUOJIFgWiW0cYkRyfHsSKZkULQJUzmCI5Jk9etrOZHTBcI4Xije0ufublBv8ARJ3qqkjS9sPLLXsGqWLDUTJVCJc8AOML+swgeqWmn5sl9cfjEGLfcWDb1aog1HvhB3U7GA9ujdGiFmozjnerNQv/ttEPH0eI2RCS1p5j01yFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488047; c=relaxed/simple;
	bh=NS0xWcLoVME5uOWD0bjjm8cQgFmCQDhMl/k6oEHHG+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu6XeqRKo6KytemT79yCU405oKrgpW+QKBYdfPbyIcCdLo+1bhyBZ2IxbtWHhxE+xamlbf1VPmQmy/vaHipy5UH84wjJjJyWA0c6THgYxLpaZrD2isjnLCyvXirghg4lRB9NVPL6usg6ZhwSYELTdq2u+2oFgekDfkbXCd7JzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjGuzTz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVq5xpmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjGuzTz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVq5xpmq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RL20873749
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 12:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yUnCZYYs7mTlaoDmwmTKxBLP
	MujYgvgMbUGZZ8Nnqh0=; b=IjGuzTz9CC9yCNrZ1/tQWCmrwOXp8MFV2rCmFVg2
	qWVrgSFWq4NgQUvEt3D44OEm7jhyAfD7OQHuGq1KAbHZkAliQ3uW3vGR1Ev2BHsr
	Wkj0Z4aCgO5nS8YVYj9S/pQycVSEpqmDdzV6IYYFsbbPjoDgjUTXor2y9ITF55v5
	+tD2xq6yiKYFiRxVP5CCmzisLizyI4PCiV0KZ3fzCBuO5lHW/g3Q1AA/I9VC0grb
	Y5OdV4QPOQdbONvPCynG9CBtUQC4IukG1m5eJnHejZOqyddTj2WVDb2e/PCf6V9W
	So/tl5jr4oT2Q82CNkYiPrBACj1RCWKdHnJLetQxmAlhvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9kaq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 12:00:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c69c788ce7so1810273137.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488045; x=1781092845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUnCZYYs7mTlaoDmwmTKxBLPMujYgvgMbUGZZ8Nnqh0=;
        b=MVq5xpmqyP77BI/jH32Z9gdY5BatRF9ngHBYo+oSM//sKVA2QLRyrdIe3jnPBYaicB
         KNzYldPsuKzi932755RCfu2zkD7bTYg8KjHMblNbTxNYL+8qJtaFsxRPKZ0WfsQh69zr
         K5QXsdANBnPDcxfVuJmwE+GjuEw+MoIaxfALoDrpHmebm5PUBxgpwoSY5U1zJWGg9qQa
         S6eL4d6xPneBZaIIA4WLHZN46O1YU8S/Mzib6cwZj7bJ7H/JvfNBcwqRDnsrlbiwsTmz
         31f7Gii79t/eK4lHMC16IDooKVp0Y5hDvBB9rNOwdo73Kaxhog8f1He7phybfL6eHwOZ
         LZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488045; x=1781092845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUnCZYYs7mTlaoDmwmTKxBLPMujYgvgMbUGZZ8Nnqh0=;
        b=o9mKuTq9SxZw/Td6fJOgCT5oxSvON9xDtLlxn2/Jv6fcJnluHg9mV2ieb4o+KWslgS
         AQLD3ZgYGSUJ7/y9ikgk2UeRf8z7MJoh0/uqw86GJdMXtWh7mUpTfQUEaD/x1TlGxtTN
         KaHsgfdZ5zdIfgmOb70RtC2Cexw3B1yEPbJK/PfxnqQgqbkBLjNBbnYDee16FRwcoe7z
         t+SNakAxkUN2CRKyOC3lUjnKPRcqwH8Txp6fpKgg5MfK2WayZYNuOjW6VOepDQBaxEjt
         6g7urrxyvPIvSZQU4jw62DDrMtWM7dkrcMGcMVvy+sdAK26V9P0gdYE5+kGSqZ5bq1TR
         ZvmA==
X-Forwarded-Encrypted: i=1; AFNElJ93EJX9ytY891hFkwRuoBmeYNbVlkU6mvlycd5qJNIm9tVuTgcRwjAYR8WTYH+VJBR/WmUW75jv3RHj6ZnkAuPu@vger.kernel.org
X-Gm-Message-State: AOJu0YylZk/EtUpj4Ptwdmo0u3KYr8/5RyWZj5f+CvNYR3mIgKqpubOm
	2dm+YqKDAiCJ3H4oINyvrWagiR4rFSudIyUIJiF6znhmDATROWkUN/Xon9szGWtEb2PXmEnNg/J
	jCCAFXxdVONh1O2s+2z3ulVbUQ/zSVuW9z3fqeCWpOW/rQQypUREpxTb1r8I8Wy5SDLvxTpXV
X-Gm-Gg: Acq92OF04TgqlBG+JjA9ziiTePLNra4FobTRD66u6JSlRRgJI/328Ma8RAAv0EDq2Hb
	dKqPWdFZkcpwnrAhn3Bw0h2s3P7hqHK5b5udIsakWC1iMTlgSNySIcE0yiiueC54ifuT5GjrZsS
	KB9+iSgiaB893P43QiGot37ODuwe5AoQZvp9fz3UstIaFT5xK1HaSBP44leZFLNepO9LvV9TFNc
	9K64PB1NTaxM+MZUiFNoSJRRIzrw+E5BA5sb3reRTCi1hzfJMmH2vt8V/vnXXKsDhq9ZfTdFv7R
	rn1b8vLwBCLzlfRUr8zASFQNNTccvXfznBOMbQjzXxnfBJww9FGnlS4p+BBFDnNDdYvCSsddCbb
	iolMBqROL/jfY2DxIS513Dj5Jea5pklFXczA1LiIJ5b8+THZeOIHeNp0VN38k7jXuWXs9z2IkfF
	NYchGO1MAMvP8Lat7J81FUs8mdenC2qMJK0TtDdt7KMs7Obg==
X-Received: by 2002:a05:6102:6a95:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-6ec2ddc838cmr1114941137.10.1780488044824;
        Wed, 03 Jun 2026 05:00:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6a95:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-6ec2ddc838cmr1114905137.10.1780488044247;
        Wed, 03 Jun 2026 05:00:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm612821e87.33.2026.06.03.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:43 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:00:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index
 invariants
Message-ID: <qqwenmnyheanpivhjseokvdljdkil6ff7o76bubq4spadmwos3@5chd62mt4ojr>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-GUID: Q6f6f34veUEHsexIpr1i3H1TLR0Jurgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNCBTYWx0ZWRfX4ykFctXRC4x0
 ZzezYPwoHYSKesarQqbp+FSpgym3N+/OR1IN0K5OvC5lzNsRo3MVPFC7s9qAd2+vcYHpc57NVJN
 lqkg4ZCODOvegVbmASebjx+2+PCHsaz7nZgPNF8CBbH7OXnSkiMdVBitaGqbn0+50zfmuHtvO6B
 5MkY+x4k0jFG6jUX3o2fpkbioR/hYRKBSV4R0ReLMDNVAqJbo7JUXmcLDglmVorGz1lUbLTZ8E7
 QUO2M+qhFj70i3LngloqeVFHFOEMBy0MABaI4zuaWgzQx9bDVGu1ewK432yQP9rXzS5YJpR3Ifx
 67bWgXgOXS56SZ2aOzhR+EYYrl2m3MSpM8+159U2ZinsEQpJj/JwomO2XuB0HBi+zG4Ba0ZBsnq
 3knrbWLgBfhI9Vg17mRpvp2eSNiRJfqqGf0vFk5xgxQ+SB0I9x0Je0gwr1RZUvGjOKuJpAxV8cr
 WtQ5q5wKtmsIj35gMCw==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a20176d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=04xQU59iOt5VFKbn3XYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Q6f6f34veUEHsexIpr1i3H1TLR0Jurgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030114

On Wed, Jun 03, 2026 at 06:14:29PM +0800, Chunkai Deng wrote:
> The FIFO read/write helpers assume the head and tail indices stay within
> [0, pipe->native.length) and use them directly as offsets into the
> mapped FIFO region. If that invariant is ever broken, the subsequent
> memcpy or memcpy_fromio would access memory outside the FIFO.
> 
> Add WARN_ON_ONCE checks in these helpers so a broken invariant is
> caught and reported once, and the out-of-bounds access is skipped,

I think the comma should not be here. Instead please add the Fixes and
cc:stable tags.

> instead of proceeding silently.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index edab912557ac..42ad315d7910 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
>  	tail = le32_to_cpu(*pipe->tail);
>  
>  	if (head < tail)
> -		return pipe->native.length - tail + head;
> +		len = pipe->native.length - tail + head;
>  	else
> -		return head - tail;
> +		len = head - tail;
> +
> +	if (WARN_ON_ONCE(len > pipe->native.length))
> +		len = 0;
> +
> +	return len;
>  }
>  
>  static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
> @@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
>  	if (tail >= pipe->native.length)
>  		tail -= pipe->native.length;
>  
> +	if (WARN_ON_ONCE(tail >= pipe->native.length))
> +		return;
> +
>  	len = min_t(size_t, count, pipe->native.length - tail);
>  	if (len)
>  		memcpy_fromio(data, pipe->fifo + tail, len);
> @@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
>  	else
>  		avail = tail - head;
>  
> +	if (WARN_ON_ONCE(avail > pipe->native.length))
> +		avail = 0;
> +
>  	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
>  		avail = 0;
>  	else
> @@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
>  {
>  	size_t len;
>  
> +	if (WARN_ON_ONCE(head >= pipe->native.length))
> +		return head;
> +
>  	len = min_t(size_t, count, pipe->native.length - head);
>  	if (len)
>  		memcpy(pipe->fifo + head, data, len);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
