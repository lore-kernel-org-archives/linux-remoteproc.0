Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CFD3DA7C2
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581258; cv=none; b=fmlDXCpeEizQIOizyXHDkpbRvZqwjumWekJroBXeNXQ9EzsY/4j14XB6DlKbbQ28gHq0LWwgEkmMr1NLL1FXF5qSgBmFdiF963iquBf03bCi09ohhb/Bm9PPIIXnoAK9nGP1Hox5Qu5ViU1P97i1OcekCzgOWcQYWs+ID+RhUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581258; c=relaxed/simple;
	bh=MSNGEhj8vYE9lSz0TKEjAT/qRyMqzPRzs6HOUMysio0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPXHVPRbVy5b79rCBKcqulfpuU55lHwLMEYeo+sd2nC6sK6IH6D8CYLLzF+V14wRAy0KATWGgqlPWtgCJFcTzRNIIEJZzSyRO34OjBqSzBU6Dsmv0tnar5RzmAd/bYf4m3abV3ER/FVgBA6VfFfLdm7KokhqdbKYSzgInGcLpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p50l1JZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wuv12V6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p50l1JZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wuv12V6P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960a9d837412
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 07:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMUjuP1x+cOa3BLsYFQUebKS
	5hEQlpItYKLuhasrbQs=; b=p50l1JZvaBOSP2oH+L+MS6IFbM6iRA1n9n2W8qGX
	wqERij/2LZVJYTZCaxbWS3c6imqWd+9OGb529to3588YRzZJ+1KYLPIRg7js2EdC
	q+No46EJCRjeyLQyzAYh59MhdCybF9caYqv5xaYwT7Y00u6NPNCr2L0F6rffnoSd
	wLIu4iBQ+YeGkmgrYArCY6c8ySThQLu4IuhUgsdsT9WOFiP7YuNaEnCB8shpalVH
	L3nNuhpHK8Pvle1VZjKoraIwrtvNT7jGNgU7zqfutd7IoqgQuKkApFd+fTcRxB9a
	mdEqvyjZN2n8yH71MK2mAx0fm+MWHOcYSLoLaCAzk25RDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwav4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 07:14:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8894570b58so1242683a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581255; x=1784186055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=Wuv12V6PA7nfDF7MpJi2R1ouA4Q+QWwCSWajLGunFYmLS2rHF3iwxY5lGBoLxY3XOU
         stX91UKVq+QGE0soXR/SGMyQaBQsy2LYj/frNiaQmvVO8vGzQDCbr0WuHwWCn26NDMAP
         BGwZfdm1tnhV5OTNCzgZQFHrhtEUl2VcFd4OCZaUf/3rpLY8YKfpXE8gMA0r4JPX8t9G
         wyXmD+GnejtwXpF5VcqcJOwDQY0o7W77O7Uh++8pKxJmO4wziYwn4ahuzpTaPeNcs4Am
         N2+oNXMubRdkqDTEnLlyiiFbT7oZuWIL82lZ8taCrXYz9LT9H6xvYsFYULS4LMkMhWvH
         POsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581255; x=1784186055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=ZLK4ptt+dlDxDRrAOhxAjj8Gp0iuw86q0EaenQUvyxRLZFIu4TFKSdwtDvn+t1V8rO
         Fx12UpXwyL3lQ/3ACaAw0noXqEYIcEBczUqXkiUCthQpZqObqAbz7jA9iT6M/A1wXgTx
         j++nHOkwZUivJQp+hI29os44DQp/lzDhOl2/as5c5GajwbY9Y0GTF+ikHjNfF2nQWpPf
         wQPNYkFiSme8VM4WEM9LQmwFZ4dRwGNBQMtLdy+cn24wuxJjo3/H1lccTCwmhLNSXTjJ
         Nn6BYhtoChkQKfLAje/hwYNPyhUzBhlomqsYIVRyX4wgYzdyAUD4w7WZuzX5d99qSvHc
         Wm+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpn4C3O4a5CNPr+vR4LBuUJmBiFFqapiF388UOkNAi47JWruJdGeiGG8mDduvHnqGI1NRRmqLTozAZ70cYrbeWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfkmiLZMR9KCQheBjRlYf5S4PzL4CAa7ZAVAmPnQEM5DxPAAP
	fTMj/6HNcnnEMOZkftKi53UyYDKsLkfQhFhxtWHJ/UYERlyOsKvc5mb1xFj1d6utTG1+gmnU+g1
	OuxijNp1ANCV+TeWE+1iN3foMQ2X94dUW0cQQaU5dSTEgG1JZoupd5nxvSSLYBCogrJbILA0N
X-Gm-Gg: AfdE7clVOApqlONaQGCN8ZjvG4Ba3BqXPTIFVMrhzDCDDBLx5g7KdMphdLFEvbtertG
	3s2pWQdttFlksQR6NExMvWF1jgr/GQnYy1XmhRvNdtkNLPJYb7Qy02XKMISPBG+S8rcR9BEVw+q
	WZY0iNXrC6/lSLgE6GdqodKJzrbw8r4Ka34kuR0ofHomcCYOhFfSNYrCZjIGEpc4CWHb2Su/N6P
	G4bMcf5RvyRWOv9flkA4Rqu6YHVQkhim6QHe7zhiQ58JetVJKj73/1bZsLMsSFhTRnCV6FBqci5
	Nj+4iwp0Fd01BP9VAdf4ZiJMoHtwxs+2vXC9f7tS5L5PMLJRslj3uLvoqPOd9qyDnSAt2a3ID+T
	ucHJ+TtHl7RwOUwNdt0gVuvpGV+equrBmXDf3rw==
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464202637.48.1783581254542;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464160637.48.1783581254000;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm28740179eec.13.2026.07.09.00.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:14:13 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:44:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX2/mSX2tx+MrU
 HZWK55helFbrwpQzrXz0YNUUpv0oTjuPrOu08h7ztASNSX+S77oJxUK63F70P7aKcmsMam9aN4i
 8ttJdDkLGGy3x1MCF0JR509ij4v/Lt46DFelD7nNUumUo4MiKpyNdkWgkX9MO/AJ21yW6iFTEnF
 sTI/tJl9IAyA4bGOGabonDUklLE/FYDj1cxvVk2qOwdNcRkcvu++K2Vbh/eiJxS66pGmeEZ93lq
 X5Gn/4NCXlZus0xey2+DvUQti+mk6KxQwVRqQsvxQQL/TAhhAtJIBeNoIg/9bLUC5Gwc+2EuU5G
 wzj+GxVGAN4fOeIbp4Yq8J0EpaiVxEQOWe4u54csyRjjK5ex39REdSzfccWX9cTkYcsPbqBukxC
 j1icwD3K0UaowLGNuM8LLLK+2TET9auWCMiMi//VlVAKLomOcf5DTBg59HWSVYSuVLAey7gybiQ
 hAWF2RkxbTQr/Zxucag==
X-Proofpoint-GUID: rVMXurYs15ET9juAMUBWyKYRN8yhF4E8
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f4a47 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pV6Zj0bAzI97IrYWChQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: rVMXurYs15ET9juAMUBWyKYRN8yhF4E8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX7ZZ3hgRQxNVx
 kRb4YnhcGP9yM2Bv7knrEANTOWCBY+WyHfvBhgGBYtv0cutyN87yIesAA1SlRV66+HuJQJuBk9A
 q+6kX2N68QBADUwrXNqyokjQkJPX/DM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090067

On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>


It should have fixes tag ?

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};
>  
> 
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
