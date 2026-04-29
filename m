Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41837311954
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470796; cv=none; b=ded0b9BeTw+QvmYHObsLgwDF+5OYFZ7t5y8DW/BaNswJAsj73MRseTc9OZnWmLHimQhalDvvbZyT8axDyiLJ5CVShDYBZrrMlMN/dJv2n4pPTwTFfCq5J4Bslmtner57eAkhOxTqXSclYqf5+UDXxNaDPx8iFCq5EnmRSldWEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470796; c=relaxed/simple;
	bh=GTPA2YcB/zw30wy+DRHalzb/HWpk1KhTEVzAqq0pRq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaZU3RLgW9+eHv9/K+In1ebu35wzUuO2xfDcneANFav2HkeNEzmmvo/snTpvINMbDDVDKf+XJ29U6GGTkBhDwrYBWwVIjTUjAChR5ieq6CDmNtBe13RzxOgK7PwRDTi+dP93Unbsy+thaBvcYD19Ux2e2RLUal8mEV3gBmOgPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opyL4EBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTh7nciP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opyL4EBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTh7nciP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7cQ1721232
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N9U0SUgWF2lcmbEYf0NBfn0l
	dEy8tcMY+YE7XgOzUV8=; b=opyL4EBS6uDORxigC+UcE9nHJcnx30GM4XkEiaKJ
	+EKqtzXUpLkVEyXvFEr+OwuSno+GiOYRHQD21jvxb2FquWGStamzVGChieH0Vz/Z
	tkD9WFYveNCeJLXqD89niR3bF1KWvJJqWDGIHTsM5zL2vgXim8F1CXJNrPLdIyE5
	jF+wZ40Obr0A7V0abVcLlwzHgr2W3AGwMYaPBKyX6wVizsjyIZA+knAKDfv8Pf9C
	Q+NWs/qQ2X+nP+ibrFzo9BzC8zWR2BbWcKjjxOek36vixHMAuF/9v8oCmSvRxohY
	wK0l9GILTkz0aGEXhyH5u9yBWIC+BbMaklBh3ow7gNashQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7329qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70dd30025fso16005566a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470794; x=1778075594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=ZTh7nciPFVfeCQjahrKfG9mxnwFJ296a8aQ6UbT4+TbX3/XUuQN4sh9qZnjt3ITgEi
         wzZICVzToKcPsT4z9BaAuyxlVR/V/D010bmOk/rqKyxrNMmhyEEDl7oKnxcBysFLBZW6
         Wyvt4RjVV4sREIveNFIvE0I4lCPWTl3DM8yKw/a5qFDIEuHlJ2U7+H2hioHOb3M+dhxz
         /mLg9F1VPnUzKnGBG7coG0+D6TXp47Q11Kg7utN2cFjwmvIVOGYs7KEkkFUH2l+nmbyl
         2AdPiiWAicVCzEEz8+fzRvgxjGxwU3mxsNJDiYu3tMHqg6ngTWNHJjyfcUwAnqT07x+B
         Q1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470794; x=1778075594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=NCSe05Vk2AZjgLsmHV9+dvP4WrJy/dI2vLzbC2MJeHWXU5C3jCJz8CXUnr/3OvHRSJ
         UCQRGKyyVyzyLODSRpiicDdCYFeupKPf6285IWdhwJX6Oq/pMvjRL1DKEWAHwWvwe0m3
         tBvV6uufUSFCQA3jNQcdyNwzrzG6Nzjpxsqd5IQjDzMB4Te7/wSm/359YEBQg/6PMTGb
         lN0jNl12Ll02+tf4kKkKEB6xJuFMuM96HFMFYCuunTPiTZcd5X5PJb+ij/9wibIy1FeZ
         ofyxvAi1KVikPOljp/joH7szDbmma+Yd7GRXeFbsNqCeF+bi47WqbqT6hZDcqB7RNMe8
         NItQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qkCYrez80fF6vI0QQDR+h8hnfBxepf5OeEO8I2PttHuRm22SRlJeUEnrSKV/RILT2QUWxaGIM98n1pxzgB0fl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+PINTBAD2qsplA9T28DXZE79sO7TH5zm8fTBLSFG/K5GUokI
	lli1j9PbgGk4PMYA0XbJLVHWBm9ng8W2fCdLB6FP5ijv5JLoCv95hUhHu2aMaJAp21PMMOaAkdq
	Ts+/vl2+uN82Fz2QD4XAwqPugGi7xpwk+NzBTxVQgsLp8AddUi/t6OPCvK9NTxojCaY+u1Eb9
X-Gm-Gg: AeBDietep6mTWu24n2UEr3DDd+GMcQryxEKNJD9RP+uoXkjPse8TDRyGCyARq4tjcwU
	k7gZqRAFmtXbmn9KsAa4zq1BKaabLvH3gBRAynt7fQk8MtjWLS8coE3E0LbrA9wOfcaUQ9OThOy
	L8zDZitG1vFaIerak/gb3U3HmrR38+j5s4gowZWropwBNKmvZ+Q7oFQKMRx507y/HTeT4LASQU9
	ArsEYcQLFVV9tgJS3lk1VInhxoPzk4La7sp+aGxGd6mMS7kwueGp9d90grTF0XGOaSbKA9pgsiN
	4+REwCCavpA4+z+bwlQrzbVKyT4pMoLwWb3y7qOoDIPNajI33FR/DUl4tD9Y2fMF8NczCUjc1+G
	wrfx9Q5P86omG7S7tjFixM2Ke9ulbBoVrSIs3Tlr6t/fkDHYrk2qZpCBlbvY=
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647868b3a.31.1777470793685;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647813b3a.31.1777470793036;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cccc4sm2190396b3a.14.2026.04.29.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:53:12 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:22:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/15] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-10-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-10-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20d4a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=L7XPiZuQ2t1DW7kJCHQA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MSBTYWx0ZWRfX/r3zDVX3Vu5e
 Dyt5INvGldyf6Bw4mjDdvQ5AvgEVNa7PtLjC/c9OpUnI3oTd+awPI7lMaImyuVXLQtXXMnxIdEL
 4iGrMsbvRAIVojpH9Vcnw9yB4WhpLfAEnOqXq8Q5RaAfeeniichHTT0mQZZ2GyDAcZU40ke5Bs0
 KpZR1i4bjCF3xlzBGtItjrXnUNmK7erAP058nBoN/DdmJM49TrbZ0UrwJKgP3W7fSj5d0ikfRV6
 jtf0sl5Zd46yknGds5rxg8ut/3jU+0Y79KGabHTa1HWx34LPmhg/phsnCMT0iQrpX5qPWdWowHn
 V/Gs25OaOU4R91+tBjuaoom9sP5FTXHRW44ijwArBdA+iCkGfgEzGZm80xHED3gUU7m2yg5FO08
 K1uiZgepWBZ1EsHoUdmEHzW8EsvKaxTLkP9wErrzD/4NgHuM4qG+zrIsTq5naklObDiSKAeRigC
 k+1RxAuWetHUQyNzzzQ==
X-Proofpoint-GUID: J_IjGSAVh0G1Svynx1Jz-BYw0sLJefMv
X-Proofpoint-ORIG-GUID: J_IjGSAVh0G1Svynx1Jz-BYw0sLJefMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290141

On Mon, Apr 27, 2026 at 03:25:57PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Select PAS generic service driver to enable support for multiple PAS
> backends like OP-TEE in addition to SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..da3c5d9562ea 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM

Check do we really need SCM now ?
Why not the change for WCNSS, MSS ?

> +	select QCOM_PAS
>  	help
>  	  Say y here to support the TrustZone based Peripheral Image Loader for
>  	  the Qualcomm remote processors. This is commonly used to control


> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
