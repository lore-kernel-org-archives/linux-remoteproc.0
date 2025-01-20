Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744BC18859B
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jan 2025 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355175; cv=none; b=cXILg3JPpMMEZ/76IlImU/ZuhT9aXW4+wvH49rZWbvZ/lJUWKncEZrKGT+sgDCWzPquVwR07Xk3BvTTwWaX8r+Jag8parVUPHuynP+Llbqc5yO9CmodfWQWLYQIh/NYLyqmP0M86CHAmMix7y5Z35bJwf+mjkALpB8mHMOXgWpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355175; c=relaxed/simple;
	bh=Hg0Q7UBjPXxTO4jA9v1+V2EIcNAUhgdVIEsiirNBuY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtM5py+4n/DFM3Lk2GP4JtbGiVyv7UZjhXIqXLjoA0RTsXKmVDzwCamJEMqY2uAR+WnO/8q0pUTa2O1gnDfuY36rh7DY6zzP/q3lBx8KD3+u85wXmD5GzJKotj/BhwtEvBRGMvZAPfSFI3KT2Aw95lvf8EqPL1AwH/V+gVqkEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAZavQnr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAZavQnr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6ZZfa016277
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jan 2025 06:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YEp07wamDo/nPW5MMUM0lL0yxceuTlotq5hNkQb7a4I=; b=HAZavQnrThPEK0VP
	tapwcXgi3KcSpq0xaJppfJCJBfY8LbLd/B6a6GTL7mpP9km30dsmk14yyo6oR/nc
	nrNft407WWIckvzPRiNiyP7A2C7Ggj/TDr85pPd8dKZ3M4PYCnZTDRIRuFFciCQN
	E0vMbPD5zhnc52FhW8EZE/oQdOD60sZhVdQp/kMgTZq5AK8WDtnUYmCmgOu0ZTR3
	iamQ8qjIPSxtYVMF22hdrzvbxHoLu9b2Rp6GAC6yG8xxQmi3wEJojYmrFMwKvE4w
	HV7n7dJn22xgwtMXVxPAWxAt1J8m2SUsfpMS/99/JyCF8Pwq4z8bM3IPu/pcsUbp
	pc3DJw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hbw80ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jan 2025 06:39:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-71e2a44bae1so3834247a34.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Jan 2025 22:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737355172; x=1737959972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEp07wamDo/nPW5MMUM0lL0yxceuTlotq5hNkQb7a4I=;
        b=mE4hjlSIPwg6KWAZiLs5De3qlnVX8gQx4hl0iqnfS1tJS5YG5worF3hTAHV2mnRmwT
         Ckq3B9nHNPw61a5QrdAp9mBpaOQIr6oHEFejmq62dL4fw1x4i1PddIujsdnYazUSf+za
         oGsKaPD9IPqZINC3KHzd2OmvAUJt7p5V5MLLhFTc+B/6Gf6+hG/J1CZS5s2IAOuQdXC4
         xKWN8DjVSKthFpsMRjLqv6ivy1/hWXmoADb9s6QJtyF7cD+QVWXa40fyqPF5d6DOMy8E
         ijzTbfy1T1M26AIYaQtO54FiI445v+A6QtVRk9loj2JWVCJ2OjVH+R7rrqSUJWdSOwms
         h5Dw==
X-Gm-Message-State: AOJu0YxqXpgoNPqpewTRZ2PDq+pCMgOyA9RjWOqYNDOpPyTEXLBUEFBg
	SLSOm4w9DNR24lcKhKfdFpuC9S1nNXNumr6e840rwDfXL0ZTQSPqOxw1NGI+L+8YwH/x9gCvtAq
	j6RspK/NvhikhqJU3G3M5f+cnD0ntsDTqQweGwMGEmKYGq3a9ya+nyq+CugA8ZjGNEU/HyVryjv
	Xj2s391Ixh1Op45YdyLx+sQ7jV2jBcA6Sx+ItE9zJYF3IucvRMnIrP6A==
X-Gm-Gg: ASbGncvygc85NYnrVI+KwpcEcSJQTiMjOqecZUDIV+kj1GiMQQMeGWGSkr8idz7Rgcb
	rZGq8owES8bjdliD476yTdyaA437hkJp7KjagLPqENrbnreDEjwLZ
X-Received: by 2002:a05:6871:296:b0:29e:2a06:8405 with SMTP id 586e51a60fabf-2b186ca0224mr11675793fac.19.1737355172072;
        Sun, 19 Jan 2025 22:39:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjLeDSrqUjGo2V0Zo5OcxIz5Nb6wzdeKSfVL2AAME/VLS9Yj/QnfpHYbyLVRq7prN4mURgjdctrh6N0StldDM=
X-Received: by 2002:a05:6871:296:b0:29e:2a06:8405 with SMTP id
 586e51a60fabf-2b186ca0224mr11675787fac.19.1737355171794; Sun, 19 Jan 2025
 22:39:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN3W6UVqqY1P+0ZV3nwY-vmT3fArGhoF959H_15K3iz1z7shSw@mail.gmail.com>
In-Reply-To: <CAN3W6UVqqY1P+0ZV3nwY-vmT3fArGhoF959H_15K3iz1z7shSw@mail.gmail.com>
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 20 Jan 2025 12:09:20 +0530
X-Gm-Features: AbW1kvYPzjsI53eHumvy_aFT_TAms0DPvzumukYoM6CGCL_O1RJwjnYsgcdtxYg
Message-ID: <CAN3W6UUs5TpJk7yvAcvnrH+5KgmnTfF9spQ=kCW13P2JL+rxcA@mail.gmail.com>
Subject: Re: Query: DMA device assigned to remoteproc usage by Linux
To: linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mBC-sGr1cFQA2mIsyNhklSk3Vw1JNWc5
X-Proofpoint-ORIG-GUID: mBC-sGr1cFQA2mIsyNhklSk3Vw1JNWc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=862
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200054

On Mon, Dec 23, 2024 at 11:27=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> Hi All,
>
> Wanted to check if we have encountered remoteproc use case where a device
> with dma is assigned to a remoteproc with its own streamid and iommu
> translation context.  This DMA device can have a selective DMA range
> within the remoteproc carveout memory that needs to be iommu mapped
> before the remoteproc is up.
>
> Do we have any example in remoteproc that handles such scenario where
> device dma (assigned to remoteproc) has its iommu setup by Linux (since
> the iommu is under its control) ?
>
> I was exploring some of the remoteproc drivers but did not find anything
> close to DMA use case and from where remoteproc should get this ddr range=
 ?
>
> device tree ? or rsc table ? if rsc table then which among the below ?

Resurfacing this in case it was missed during the New Year vacation period.

-Mukesh
>
> enum fw_resource_type {
>           RSC_CARVEOUT            =3D 0,
>           RSC_DEVMEM              =3D 1,
>           RSC_TRACE               =3D 2,
>           RSC_VDEV                =3D 3,
>           RSC_LAST                =3D 4,
>           RSC_VENDOR_START        =3D 128,
>           RSC_VENDOR_END          =3D 512,
>
>
> -Mukesh
