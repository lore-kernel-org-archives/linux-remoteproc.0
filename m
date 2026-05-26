Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4293148C5
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779778054; cv=none; b=TKBEF7YX70mD4pXg7Fo//Z7F79z9n9YS2vpw7p8wPcxGkzrSPYiGIvJ8T9E7+3h4CZ65FM/qITcNpvX87JNMSfhuODvUYLjzIxMwOngz5REOQZb4Mn+gBusC/ntcuW6JpLIWk6/VwGFSR2P65/2vGUD+7wM3LHQX1Bro3+j0I9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779778054; c=relaxed/simple;
	bh=3aibnKJNBlowyGXaHsNdOEC8Gx5ypo0RozbXDali7yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tycx/Mo0ceODcrXg9SZ0IHzqgvPpDbsNcQutV9lnUImnwPhR9vdIZWhkwJ3p30rneApEV3zQEHLw9faFI+MbQz+hjVg8dAs3f7FZzYkj2CxlgaIoTX3snYuNYORZ0AwKlpX+OU6lo9l7uOm+L2MOHsHkaqbjni7447ylC+LW/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pesGs4Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9qgznte; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pesGs4Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9qgznte"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xlmA1604584
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 06:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IAuCr6EjYqf/3f5GsdumU1Po
	TrcKh+2YhnnJId8P7wY=; b=pesGs4Q/JEkWTdAyfKRZRsshkVLI2IsriKtHY8BX
	IkqCUje9pjRAh4kAq/bho+D6c9Kng1VomelIt5mCTKXjwpKWrznwbb18UqOFQZc7
	2EC/dke5ODH1LpljAxggUTN8R+fmr1wYKHjoMa/MNqZGn7NiYwT2qm4fSQotQpn/
	5nU6JYftQW8Ww4QLBzY/eshQAdW/IZqQD/X+m+pcjPSAixW870JsQIvnXArFQz+8
	OCwl5qakfgqdBK41wB+WZyel0MIhIezfQXNXtGqzuZXWN1dzf2EnsATdM3f3gBNZ
	zhqsz6iBXbCiW4OJpFTDROq8yJ8XOOUS1X8QWvZvLpINLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3r5cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 06:47:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so59329631cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779778051; x=1780382851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAuCr6EjYqf/3f5GsdumU1PoTrcKh+2YhnnJId8P7wY=;
        b=Y9qgznteaiIGsClkLQpnsvdvwgcun7HjSs8hXdCbChEF87BGUfz6EtXJeVPZqLORaa
         nhmSc5ca0XsYGAvtScgPwwzeemuQbyHTtfu4dm3+s6fbTabJf4FNV3cc9lm0Da+LllHF
         xLIHUNyuZWNToByFGSWLtirGeBF8zKL1Rh/pM7ZbZQbC5I3pcMNi0wzPnHkZk8pdvfA8
         FBjTfhm4LyqnbPQliCtX5VkWdkbpCs9ifjr9abzzJElygGj5yKvSSfo5blLmPKVcA3f0
         gNjOaUW9CejM4o/JzvjNxGTRBIh0DTwS3ef7mJz/m2Ssybkh2D3G6hYcxpCtDLJSCx4G
         56wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779778051; x=1780382851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAuCr6EjYqf/3f5GsdumU1PoTrcKh+2YhnnJId8P7wY=;
        b=g/D6p7Gb+lFiKvcDEDOjKVAA50JeXR0SrMknSJyNlLaXNFVd4bcTG3GqxEpS3xKJxC
         g5coyFLII0Nv93OeCYMJ7TOT9Gcka1miWz4r9rK3k6iDJZC21G/DoiKbncQwL0LbeKVF
         aiekMhMh64J1EvCeiSU9UrI7V0PgbTwFPPGDL0Mbj2ig5Vi1g/r4zVc0L13urMO/rAbh
         ZXZYAL0zZJ9CQNGn0iW4ZjSGXp7asme+FuLUy4ADZ/ldPlwzFDeJoAKbe9Ejm8a0oXvj
         kKYExGzsuGLVaKjidBW6SP8G+QhuZ8edwo+8G9ckel2boVLPYpShtJvK63Ovw3l/5L6A
         juJg==
X-Forwarded-Encrypted: i=1; AFNElJ8GKq6cIFQqEKoAnGKYtHqxrZN8Hl0gzKVzdkChKnBSmxHfGY6MtMnnr9xwHB/qkjQ0XYmefQ+9ZwB+FH2wbLWH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TCDkNbeHrddTpokmePZt2YBq6e5W65SK60Yf6q2/hm7xFKpX
	Uj5qmsm6VE3VkaSjADOKw+lD3OIk0jAD81rT/oF5Uk6pRZE+gA2qoUcPBkxcph+4/xhmCF2YAC+
	TdSYj5tSbARCFCtXev9F+RuD1qITmVp/798Fkr+69wngXhxiEvqY+UFom6NaoveJaA2FUVYaA
X-Gm-Gg: Acq92OFBu3j7GIg755U3L6A7c3VO++/ihGtlGqxOUSORDCFNjG6W3WzI8SLVAhabuGl
	NwKu90x8QLn9DDf+hU4Ak2ehUV2CsmaiheZkLGpvK0ySKRO4UiuQnFH8Y07fg8FdMxI7Mb9whQt
	eeltLJsXUF2n3vSwZD0cGYYTF3lfF4FlfV4Anf28O6KhkBy9aUJcKLzEQtfIDR9eiJl0NidSn9Z
	lsHPFRSrYCAlGocz04kkcAngWx8P7LdRQc30mN1DwVX1qOMAqkK+XElNQIW76kbLlF93x3zUEOi
	yO6/W0Pf5HdOdG/q2TKNhXr8nMg/n+GuTmQfnhSObA2v63ZqQ6MymbADCPRG3f9qA+nhuD8qU8V
	vPkztUl6P4zV/PsxDsvDexzFprDVSrnyP0xvidRUh6ZI95MWlshXt6ttoXTGVQqVazXMYaSLAK5
	Ko0EFiI4GD9gbz1C9YQRYBE5EX65q6P8YdDbk=
X-Received: by 2002:ac8:5711:0:b0:516:df33:bdb9 with SMTP id d75a77b69052e-516df33c1a2mr196911201cf.47.1779778051295;
        Mon, 25 May 2026 23:47:31 -0700 (PDT)
X-Received: by 2002:ac8:5711:0:b0:516:df33:bdb9 with SMTP id d75a77b69052e-516df33c1a2mr196910961cf.47.1779778050891;
        Mon, 25 May 2026 23:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7d49bsm29651051fa.17.2026.05.25.23.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:47:29 -0700 (PDT)
Date: Tue, 26 May 2026 09:47:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: qcom: mdt_loader: add
 qcom_mdt_pas_map/unmap_devmem_rscs()
Message-ID: <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NyBTYWx0ZWRfXxSMJHld1XzTm
 M4pOhsypj5/obWZvlkhfXakqD/ho9rzMF9a0BCBLqqnhBNpuHBY29anfroPJJvN5lcGvKSFjs13
 /xs/N/wuXA2tI0W7PKi/JJ2M4O25lrq5UrF8qYDdHzbQ2MBaU38mDQg6T9NqvGwJMY3pPo5UHE9
 XqWHK6/igNuQ5+Na7MU3Yw7SD3XZu0osp2m4D9mNNn6Wh80dAf+PIP4fj9X76xnTn/lkeLxGLMl
 XaqT88W6jgmxgpR+Whn2CKmqit74Z36QQvL5793SOUKr+kgQurkq05t9XcKxQJuujHNm5nf1d+y
 7wlei8o06J12QTvn2ems4p/Wj6bcb/22DNPj2YWJTzDOB7HE6R8u2HZt8cWa8NPAgqjwPoZMTPY
 4R/oZC3wKW3fKWTH3SGFdrF4JHgmwFMZ045zU3wfcPoxElgpSAbbWPYe0Oy9na5Ambb3sO8SpOO
 MNUppOF7QlZAlD+sXzA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a154203 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lb4pW1d54vF9efD2BngA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: q3ZixjD_eUA0lW8_JbEGhlsZv3MvIZ6V
X-Proofpoint-GUID: q3ZixjD_eUA0lW8_JbEGhlsZv3MvIZ6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260057

On Wed, May 06, 2026 at 10:31:05AM +0530, Mukesh Ojha wrote:
> Add qcom_mdt_pas_map_devmem_rscs() and qcom_mdt_pas_unmap_devmem_rscs()
> to IOMMU map/unmap RSC_DEVMEM resource table entries on SoCs where Linux
> runs as hypervisor at EL2 and owns the IOMMU mappings for remote
> processors.

Generic rule is 'no API without users'. Please provide a driver using
these functions.

> 
> The map function fetches the resource table via
> qcom_scm_pas_get_rsc_table() and iterates over RSC_DEVMEM entries using
> rsc_table_for_each_entry(), calling iommu_map() for each. Mapped entries
> are tracked in a per-PAS linked list stored in a hash table keyed by
> pas_id for later lookup by the unmap function.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 189 ++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h |  22 ++++
>  2 files changed, 211 insertions(+)
> 

-- 
With best wishes
Dmitry
