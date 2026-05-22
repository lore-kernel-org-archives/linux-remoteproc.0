Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114D40960E
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459524; cv=none; b=dNl9OVDRU0O2vrzrppwzquOyXmAP6maFI0IMwOx9a02MHA4wXnsx23uK6J9ypI4w8K5xvPpkKz/nG/9dcsZEoIuc3xyQzfjFME6kwwgacsozaRaLQV0b+UhzQRdONITA9eMnsKHjtzV0C0RIjQ6i6rJfIo4sCQN5wAP9YUz2YX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459524; c=relaxed/simple;
	bh=rKk5kOKOEdac4MZDYNoEU/rAZHIAOQAi0IZqIe6ALQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO+HAoJ4MjlQP6TgFG4HokdF6m5I17NTX0B57OjkVdF5YRfNIMyj1tDoEel9v9eqlBs/zx6cRer9Lycac72JKmmWmDkD/yiMuxwLCao2RkfuLuyKEiDmI4ghkdoNugmxKmlpsTlgPjOIYH8CR0050xphDIuGw6XpfeMdKiuuqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lC/qTYdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeXBEt02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lC/qTYdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeXBEt02"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA49CN3947396
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyDl8BgAmZhuooaEQjQQKYRZ
	WgOcTk7HRhEVqKAFQSI=; b=lC/qTYdH8wki0e42+wogfuum9zXKCwai2CHMwcKw
	PJ+cH5tx1IwjNH8N0iw1HEX8AlA+0Nu9wGx5TCFKI544nCNM+Mr/jn9XxWhbuY2G
	SnyYUN2NHc3yXEkaVmG1T/LV7Iv/6rafb9c6Q8gcbB5ARKkKC89Aw8mFfhYgQJiZ
	maCfjHbu/4k76yapW2UbxDr3awRSrYdIDxMk6g8UN4FvRt6EpuclhdzT4YyYjTqx
	zLGh7YX5US3MgII4n3K60mM2dOiOqdYZjJKY02pKLFy+/AqkadlPKkIMwZvVpt4O
	/CDmcNLt6gzxE7HKNMUsxWTMxT27C1pfnadWFMVeqUI9yg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngv00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:18:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so3086476137.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459514; x=1780064314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=LeXBEt02HZSYEe7i2x+zIUub+62caNQExGmDpEA60faVSpgKUx15ZKLhcwaF9Z077u
         Xi2adR/8wqxN46ZffvNvyLfzddmAM/jnSChT1R3lbf3Smu3Rr0C5HteBQJgsNtBYZhWe
         LjyQXpKzU+0Ty3RM0aaGeNTES87Byvn+KA7oKmfNOPzIAsjTlshNeq6G86OCYRNGsX+/
         1G7EK6kP+M4CkT9a83HP9HxnNifEE4aGPXgC3jfGRXTtvyMQ+unDEfOaW91dseLNHWnV
         3TLfjRkwW7SCs7Nu0bjtxf7Po5HLGI8GTZOdgRSEEKnvqMsYK8Hb0U1VSe5wTl8CN7mZ
         XW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459514; x=1780064314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=fme6cXOwjrw4e1+VcCBDdXGDK4alrbNTOKDUwZf5Kb7bUQHt62K0yaUQzWTEl2J+Ae
         X5HOA36ZxDyGP/9buCuz6hA2Fxy/vWLb3zq4xN56qwqOUZ0jS+BSMmX2X0qz1fLOz1bT
         8+H1QfxRgN6uFE2ki+wJw7o4vabfNdgr6qRnlsPnOn5zPMueaWIDTFjKmgh9YoxZG+QQ
         W+nV878ILRCD6PVoMU3T644BYjG0tAANXY764BaE12aIHKXvjQOk49uHYahL3rt2sfNi
         nRxFQ0/FunGUgZmICTzYzJhwX3I0UzomjEXMxY06j45Lzy4Na9RW67TJ9D0IifbbCO6p
         HoSA==
X-Forwarded-Encrypted: i=1; AFNElJ81cJvtF2zxhH08EFS3foZquwC0aaxv+RKHHapiZPFXx0w1rWkuBz/gces23Ha3RLMBuK/LfnFAKSpVNWy3CCOE@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBEzP9e2+dgj/2ngN7t8UHDU8st1LOFMqim/FCNdMZuu57z7E
	pYE0+aXNQJLFvyBZBkUnp0g5tulJ/d1zvKSD/FmHePPXEG+N79N27qebvKTj2FGNKn76qw/bwBH
	blq8iLsQ7D5AOAhQ3X1gsgUCRcEkNuzJ+EiFa4EynETRUkJbLksy3lGNZPS4cTtCp+z3oufs5
X-Gm-Gg: Acq92OGEwmUVO5ff+hYMWtiMfT2QiZ+xRWxuU45K2uaoCE8vBMStGeX4qGT/iOkNVHK
	ep8rqoP+jGYkWR97O6xpirqvjvVM+hjVCVQnOwUJb0WM2+y2d/yecf3onqtZsGt+2Sx0mhVEnS0
	tw0ezGMeLEpaBRwhh88mLUauUOxa/Oqt3AFoL0JD7noUDFec8cU8wEEAXgg53FmqJ2Mfv3hnq+a
	RV6CL3LIq402bt3u+Ct0qO/9exefu1Zklkzr/fuGsUWGyp5SAxNx4JTXnxfMN2xDGdcqmDk2h/i
	q9zt5pKxYM1L2yuTARBmpS2DR3Ot9LJ/WAhotZmvV9lHQxpiBYLDGBVmdtfuFicHJbcGCB56tFa
	1pDEtyymIjETf8pue0vdwYNxLZi2pS/v4/z2/+WD3Xza0jB51EvaCtUvkmBmOpRQKN9XI8syiCo
	bAOmcPCSjgKzk/uWkoAAedD0hw/SGv8XyY1Fw=
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838988137.15.1779459514020;
        Fri, 22 May 2026 07:18:34 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838915137.15.1779459513473;
        Fri, 22 May 2026 07:18:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca031d5sm3900271fa.9.2026.05.22.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:18:32 -0700 (PDT)
Date: Fri, 22 May 2026 17:18:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1065bb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jH77VO39CjRCDWMup1EA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 0cWvmqac5oEEi3kRhYJVSwpTD5rmMr-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MiBTYWx0ZWRfX8OSiAdQIJ3CM
 K7dAci99VW6r68NqSM9a5xsD6GymPMe43z4LDaQom9AXnPejDIV8qJkN5Tb3Fki03N7Ghip2CuY
 ZPvULCAq46hV853l3PTIiSp6B0Iy//qxESmwII1oEah2gkOMuvWtjzDEeTHgAwghx6BZ4G2oHG3
 t442FyVHxT+v+OizTJjnO9KvDohFASj77dc+8IosTvKK/v5L1OiPVD83emSBQET4VXRTpMl2Z7u
 71z+4AIlWL5Zn8o5mk+HXgduK/DTt5stqLbnbe1gDBTJaoinlctsQT6oejTL0U6FdadbEOX4SwT
 ci/Ar8h9xt+sArS9mMlx+eDvCtXqsjTOzMRHy4d+yZ3zNh0zLshAok0o4CgAMz5yg0T7vGn6UAj
 4frc0tODYhKzpAo9H9C2f/+AgiR/jiwqHn5TavBywkOdLv1HEBnraBKrPvVX1XMHye43EGYMYuG
 Xfgh52P6GkJMJREAjUA==
X-Proofpoint-ORIG-GUID: 0cWvmqac5oEEi3kRhYJVSwpTD5rmMr-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220142

On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
> On 5/19/26 5:03 PM, Komal Bajaj wrote:
> > On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
> >> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> >>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>>
> >>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> >>> for the Qualcomm Shikra SoC.
> >>>
> >>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> > Ack, I'll address it in next revision.
> > 
> >> point you can use sc8180x_mpss_resource instead.
> > 
> > minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> > For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
> 
> Is there a chance the same ID would be applicable to 8180 as well,
> just that we missed it in the past?

Do we know, which platforms were the first to support minidump at all?

> 
> Konrad

-- 
With best wishes
Dmitry
