Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31343016F1
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664622; cv=none; b=qTQ3aPi6djusFwnc/5TgBPuxrlnT40h8+9b+Kco1Xv9TpF3QidjCHq74RwlF0CpH/WIRoqrledbUsBqCJgqEJzJsc8Gm9fry7OMWurhdjdEDS2MmS/eNcUn1mHbvFLjUkTXRxxad7xY7lTbTgr6n7X1yLc/t8JtBgEp1ogfhRT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664622; c=relaxed/simple;
	bh=2f+oyT22R6+ufw0lsSoxkkFhzOSzFUApxscYiZJh5yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ayzh44Scqt1o8z4zc9fJ1RJuQRwLj5X4MU9RhSGwzeNRFpVJdtE/fW5MgTcNBuDdQtOqAaw8cQiXfn0rgeiEUGTergHlvtyw9O+auE/mB2ZDFgs/BiRcarX6xnMa1I4FmDFCSsbwcZQZqyzuSbwooLVrU/vok9SYW6eEnxTOYMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFqX+HK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNLc6ATG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFqX+HK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNLc6ATG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B22C3vx1090571
	for <linux-remoteproc@vger.kernel.org>; Tue, 2 Dec 2025 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=; b=mFqX+HK1LRESWUFL
	dEfgw2n39YSmuvs9JElkewYEoc2EQ9t2BkXAusfKpZfnSbgIqoOBT/eZddLkSlMA
	TtK99/RmM4rZtenoMGtf1K8xamudSKOzafXR1HcoZ1zZs3MLWHuP0h34TZrzp7FL
	AzXAw9GWIsQmsUx0r9JyGnNh1UO4izMiKHj73zmkdKgRPLUIj8PJ/rHrEglLH4gz
	Mt0ywnkeDhr7v01zbByrxXY8BBcK3YTR146XxVs2xdx5EEgedcHdP0ACoTNGtZ/T
	zy4l/8/BbSjgGEfrbmuiZOEfnX1SLEzkQt6AnIaZtyY2Ctx7gXdZmttEo/SBjyqo
	yD1R3Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu12hcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 08:36:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c7957d978aso4958477b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764664618; x=1765269418; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=;
        b=RNLc6ATGmjgLwrjqawWWK+LatoPTiZSGEJy3BcFFjEJsq94M4yjUwI0jMNHJIx/H9h
         celBTltrzR2rc40mguqkZ650UyqVgtP5y10y9AmSsE4rmhAs4qtYKAjWHmGRaJjm4ncO
         4ga0fmMfhGHSbX+8krKMI+SRzunDoZ7hXP7df+SJz0cJbEXTeaQ8zJDx87a1HZNQpZwZ
         lQXSbj/GLgun9bBWTHGUYnZXjkcXzjL4qYkT0P08Wc+rBmoTSCvOzYSUEBsfWOz0wZpf
         9eIym+brWZtsyewxsNkq41JOKaMbWr0gK3/w4679TAP/QPX2A6Ul70NFom0ecap/GsCo
         lyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664618; x=1765269418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=;
        b=srsGMeFP9mjMP6xIPBNcgxnY9KVl0aLdU7DHHvAVKCW3lrol8mlTXBOzhRSd3acbSy
         P8u9+pjSJl/DEPWmPjeZh/na41EJqmBxtINvO2rkz3yqAyLH2aSjBing5MT3w9uTVgDd
         vM6RPHvVFy196bOQAUMbx76xGAGsPrDMPfLdJMaLIPD+u12FJm0Es85Au+CZ1Jt4V9Ec
         Wkd9RHaRXbUR7LxiWNqrc0nG4RGI2OHC2XlrBDLCIhaw9WaYxdhF/+Zk2QmwIra9WgBi
         HXayM0jk+piwwVK7XrLwxT5Z7q/BDaQSdsmZ72xbcboTPCVsqr8twDYh8q3HVfKT8BLE
         3hVA==
X-Forwarded-Encrypted: i=1; AJvYcCUVZv+cUn6/nFbV2IXuHuxj6yersjlvprUmkCVkwE83JdYt80JbbJXN38GXPF+t4ocroMZWLkh59DtjBxQ/xwh4@vger.kernel.org
X-Gm-Message-State: AOJu0YyL6frCok3egdVHSp/1S3oUZc4kkP+G+6nCUxZekhwFrrp/tmn4
	J1GObAgu51gqPEdsmSP1OAhWguP/iYgPNT3qE3FlmtqrZixtSkl7VUn67uQ0OKp7Sn4H6wLPPys
	Z2Cc+EOibYk9fFjYDtXPFPLSSRlJ0WmVSXq88Xkiva+wr7/gwgObrbSo6Hb4KXGaqMnqnzHAk
X-Gm-Gg: ASbGnctdNnz17j9ZQVF/JaJQHQqN/bJJDD00cNnJJEaK2hHxjo8W8/RJvlqDGSBpMTT
	zCr4GhbdLilKTtuLX7VkxVc4Nz3KFhlluas09/T/NGg/rbwXunKB2t30xlGMC+1Pr/z61JPFYp+
	7gzBeQ6UnrSroBOsqqSWmWRCOXw4VYw6+FZMizsezfVcGddKpmM4LYrC/Rupt4NCfpYU7XUKy2R
	C4ZcZNZmQcX1/DhD7VEZPmkEg1wTEDZoXGQMk7uDBsdS+xUy56Q9qq8W9j9HOX2hPAak7grBT7m
	XOg/xxmTLkuqg/pEnsBW0/6TSGdWnv4P1XTzcJmbVkPlYX8lazOiE56nIN4KQe0duYuGCnz/T0Z
	entGG7GDi70t8mC/O7Yw+4yhHP9IWB3U0qi5H
X-Received: by 2002:a05:6a21:3395:b0:34e:e0ba:7bf with SMTP id adf61e73a8af0-36150e1fc24mr48387153637.1.1764664618274;
        Tue, 02 Dec 2025 00:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFfcyGB74lclpQ93vXWzJfbznVZKLqfP1ZJZEp1qLtVB0QSTSWqyEngdybDcfSBj3gxxXBGQ==
X-Received: by 2002:a05:6a21:3395:b0:34e:e0ba:7bf with SMTP id adf61e73a8af0-36150e1fc24mr48387111637.1.1764664617636;
        Tue, 02 Dec 2025 00:36:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b684d7sm16158039b3a.7.2025.12.02.00.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:36:57 -0800 (PST)
Date: Tue, 2 Dec 2025 14:06:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2OCBTYWx0ZWRfXwNM+/xGWagV0
 IObh7mEkdKq/vwbSndzdNDCh/TjhwPupW6v/i9s/XBEXzspUpQQmBEps79ADsEyE3iYW9lfJa+y
 4z5jSX824eJIYv6eSTjb4AT1HJB9+gEUZ5QMJ3OgrDKxSMGywMVwGivuFHBojJhnvOKri3Pc61A
 UJszdPL6t6O6K0P55wz2oONXLKShcSSWjhjwoayX2K/M18DlIp8fQ7opaM4Yk/lj3ium7dfdv+X
 xTyoix2aFLkG4eXPkPnbbhuSXhthfIrBTX6BXWCXzLqzzQq+E6stBGjFNrLbDxA38lH23gwwRZv
 yrn5u+aFgSEryvwX8NsL2SLVgvQLNfuTgcfinsdTl3CfRNruppQqQJav0RZZbLO87Lxcqg/fyXT
 bO6YI4YpTXww8gLQnPUePC9/sfdl4w==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692ea52b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uEwPF_Y-ILqiIyH3WEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WI5UwMeJhdDYcBg4dmY-gfchk8I8OPvB
X-Proofpoint-ORIG-GUID: WI5UwMeJhdDYcBg4dmY-gfchk8I8OPvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020068

On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
> On 21/11/2025 11:37, Mukesh Ojha wrote:
> > > Sorry.
> > > 
> > > Did we actually come up with a cogent reason to omit the video firmware
> > > loading here ?
> > > 
> > > AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> > > getting video stuff done and storing up trouble.
> > > 
> > > What exactly is the blockage - is it something you want help with ?
> > I replied to you here[1] and given my reason..till something concluded on
> > "multi-cell IOMMU[2]", I can not add video and block what is working
> > already.
> > 
> > [1]
> > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
> > hyd.qualcomm.com/
> 
> Why though ?
> 
> You are mixing together the issue of multiple SIDs and the original loading
> of firmware which could easily reuse the venus method of
> 
> &iris {
> 	video-firmware {
> 		iommus = <&apss_smmu hex>;
> 	};
> };

I completely understand what you are saying, and it would be very easy
for me to do that if it gets accepted. However, I doubt that the people
who raised this concern would agree with the approach.

I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
banks separately. I’ll leave this to @Vikas to answer.

Also, I do not want the video PIL discussion to be part of this series, as it could
unnecessarily give the impression that this series depends on it.

> 
> That binding got dropped because it was unused in Iris.
> 
> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
> 
> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
> is expected to and what the VPU enablement story is upstream in the
> meantime.
> 
> Blocked it seems.

No, it is ongoing, there will be next version coming.

> 
> ---
> bod

-- 
-Mukesh Ojha
