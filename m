Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9F387591
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235688; cv=none; b=IfCGYFk2PaIkO7mdFhf22ntTaqb9iBCUsh9Wit5hMsoxv9Jfwo0N7rCumy+9wXrH3gGyg/0aPPW1xBRaDhLQP/8yhwgB/MNIA9qYkTZ6TUErkXGlY4EaiCJQIIO8uessGpzC+d092iL6ys6aACCvszZJ+KpKnWVz1A6PYnU9emw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235688; c=relaxed/simple;
	bh=6QvB7huYMux0VK3w60OaJPQ7kp21zCIfWmT+zsHmKVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxhkGGeYJlELRjCzqf5ZfLwSziYmsISRb2pP7lGGpCCqbx6ybKkrLHcu2trP/asHdqNa0YplbmQzxTqMwdOZsX6Aw6ix91/4Gc9aSRqxosPqrd5BkQiBmNSQlz0hppyRY3VbZmPgNknDpnRGpZmyK9zNVI5pnJY5k9F9InVGGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2MAv5XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsUpYmtx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2MAv5XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsUpYmtx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLRwZV2048594
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 23:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b4RPVfEauVulPNQw2T/2xBrD
	ug+mzawESETX0L19vj0=; b=k2MAv5XU9/IyucUK2fIrUwROIS0Q0U70c4PayRyx
	d4TK+qUjx3MxyNNleQrDQ7ZsTcQ3dxiuy5J8SLoHFRz/gcGRhbquLpW8P3wZisbW
	s4DHz/5VJvXmcId00Vea4I1hoQJ1x57YP7pCCoilGuG4yOLKyAGnYJ+VGcI2+FQV
	IHmBjWq7RyvspaO7PcV80saLhBs2O6xYczPO2b+sM0XoOCXeurdt+73COjdmEgiV
	kfnRLYtMy51QBgX+kM20S7qWkj89SXVfBdxWE1cxpDRCkUIHpNPqtLkqDaLsUjuN
	KgH971N0TFi8ylHLofX82qPepJFvnfgbOjQZvaUP7MyN8w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckjgwrcm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 23:41:26 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463984b79e7so37908087b6e.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 15:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772235686; x=1772840486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4RPVfEauVulPNQw2T/2xBrDug+mzawESETX0L19vj0=;
        b=AsUpYmtxvRWuJV/crLvY3fPnZ+1aY68fgXTWqdhcWh9lkGtof6po71QIP1a10ciVGN
         cUtOHFE0dDtY/5x9/crdFR1Ja7RzPyastYU9vLLB9M8WT5H7m9PbCibyd4n9osRiltlN
         YQtMBDN9MaQ7/WO13sGLgz0YnwrDtOchw+RHLPzsMX3Z5kgUMPjFn0El4TTguaSvLIkV
         4X7oBuWAcIcIZjTKTppFzGP/KAZ51MhVxAySvnU5SxAwCoUM/mCe4LK3Px0FCD5dIyoT
         vk2NI2KdFv07YyQRAaoALnm1Xh49aclIpUwAbQGYAbwUgcipH/wg966EyY/p6MZl8qQD
         IRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235686; x=1772840486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4RPVfEauVulPNQw2T/2xBrDug+mzawESETX0L19vj0=;
        b=vXz0kr3YgsTaW7tElAKtMxoaDBfZjWuny8a1VYfwe3T0pfXsVbxXGncuJ2rUbhlC3e
         mnygbX34YXFc1DkdiLPor4N25C8ALeqIWAUs2L6T9Gvf9GL1tAwLfRnH6VkkXVMy1vkl
         C8xh2tbmJ1vhBU9CaVkoFSpJuTT569MSRiPQTaeKZQkXqHPuyfYR/w7MJn+wQci85TAM
         6vRP9+vNDpuGRg+mHpaCT9/KdgDuUvbe5pLZEC3o7/uB9vg1lXR0gVx0MRAog4cyz7O7
         feotcL+wICkqJ2vmYJiOXuDWIgaX6/pqibQLJW1xDHwWNbSLGjLLfeTxnCKIqXnFwYpo
         bMAA==
X-Forwarded-Encrypted: i=1; AJvYcCWiFzY6RxE7AtgVdoLcOu2GOM7wi2t9wYapBSAeaQWTT3G/4+goSnf3ezUn7DUf7B60J71JVBOVJNqNVkI68VTk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cDIQaLPaa3jXAWarnFFlAFYf46l26aeesDigrtkaHXmtSCK1
	6R2JUyo+FL0RVkoI0NMawiHa+Kcb2fkEPmrLbVO/eQaEgxkl3Q+k6ZPnR4x9WQrKc3n+3tjnKau
	wTuvspnJnjGpZDKRfO6N5EEeOKUIplh1iKIKVeaWg9FuGe10yKahfeaQqflcMGRzKKrixaRsT
X-Gm-Gg: ATEYQzy/sO9iOuexp9r2A7XEm8pq/arXpzCemHXSxlHeGlenqCvWUU9+KnPHczaZOSS
	iK2ZX7W7FSbJ1X/wmLDNiJKLF7TOXNB6mb5a5CjyflpwXwP6Aa42xJmF8F83djxaCurTDyfbsbE
	jHgTAGCOE4swqQn4eYaU+T8ecICmtkNl0i30Kj6du/LA1cOZaqiIffZey7UwyBSNXuptxwENy1s
	qzHV29CDppEnX/3LQUvGgWViBLVBfZ+g7eQsQA1RdTHiGPVWxApGsehIpHBKxgfdLrjA906IA6D
	7BUoXs8WQpmTV6MzYBs03oJ41XYj0/PIcaG8jNaCVZlAvd75OH7I56dInVqz8TfIDRvl3klylAf
	HwAyVPjRivoSTJzX/A0WahyZBRZ6ns8umd/nxJG/APk70NTfqZTYgtFtvRIoJ3T6j2GkuxwVxFE
	w=
X-Received: by 2002:a05:6808:1391:b0:462:aa0f:4375 with SMTP id 5614622812f47-464beb40bfamr2716102b6e.39.1772235685765;
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
X-Received: by 2002:a05:6808:1391:b0:462:aa0f:4375 with SMTP id 5614622812f47-464beb40bfamr2716093b6e.39.1772235685424;
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb4028cdsm3001607b6e.9.2026.02.27.15.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
Date: Fri, 27 Feb 2026 15:41:22 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: sysmon: Correct subsys_name_len type in
 QMI request
Message-ID: <aaIrokT+Ovglo/Tj@hu-clew-lv.qualcomm.com>
References: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDIxMiBTYWx0ZWRfX3ZrjEezgvdiA
 i4w1q+PThLm8EYAjdNRoTYEBM5GLqP7kG6P5UAUpinb/laFGGcwgros4hwXZBzO78g1G8XWD+Wj
 FzTM4eBn/oeGOdLuIYguXLil+w/LGq1MggQSm8R2HHvy8aEdL0ep0AfuvPAbnS74TJrji0Ijh3g
 WWcgpMNjQ3Xl/wjT+9VgmGRN6TJvldAuQulP4E1g+K7I1gQ6xeQTN0CO1PcmFBrjaExPSvyL3Ir
 4x33T1dIatIvpbLRMxyxuBbcqHW1AIqAXOr3FahAAxQHRsiTPcL5WDm2cHFr7kK0Q2sAPXKP1Gp
 oEBWkKXN0DGNePtxn66QNMbbK2zim8lLIBq61+7GzwwAp9+A6Wrih4oSg0qNnEvmEO6FQA6En7L
 1oT5orFdKgw339Mr4pJyNX5uPdgcX4sJ/OY+IN1IJOYJMP8aV1gMCBEsufGY4eDnkmdmUbWlNaY
 bCxi5hH3+jhTYcek7LQ==
X-Authority-Analysis: v=2.4 cv=TdKbdBQh c=1 sm=1 tr=0 ts=69a22ba6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UyUhSrBohwOpVuKZ7twA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: G9teG-Bedc38Wnp6TUf_jsLmAwSYDIy5
X-Proofpoint-GUID: G9teG-Bedc38Wnp6TUf_jsLmAwSYDIy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270212

On Fri, Feb 20, 2026 at 03:11:48PM -0600, Bjorn Andersson wrote:
> The QMI message encoder has up until recently read a single byte (as
> elem_size == 1), but with the introduction of big endian support it's
> become apparent that this field is expected to be a full u32 -
> regardless of the size of the length in the encoded message (which is
> what elem_size specifies).
> 
> The result is that the encoder now reads past the length byte and
> rejects the unreasonably large length formed when including the
> following 3 bytes from the subsys_name array.
> 
> Fix this by changing to the expected type.
> 
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> I believe I've checked all the other users now, and this is the only
> case I found that needs fixing.
> 

Did a quick double check on ipa, ath10k, sysmon, pdr, slimbus and usb.

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>


> Changes in v2:
> - Fix the sysmon driver instead of the encoder/decoder
> - Link to v1: https://lore.kernel.org/r/20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 660ac6fc408213073942f20a2c4e43a0c9b9b37e..c6cc6e519fe566a92505dc57c30e8b3e0a697179 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -203,7 +203,7 @@ static const struct qmi_elem_info ssctl_shutdown_resp_ei[] = {
>  };
>  
>  struct ssctl_subsys_event_req {
> -	u8 subsys_name_len;
> +	u32 subsys_name_len;
>  	char subsys_name[SSCTL_SUBSYS_NAME_LENGTH];
>  	u32 event;
>  	u8 evt_driven_valid;
> 
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260214-qmi-encode-invalid-length-310dd551a186
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
