Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6F3BED63
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783315; cv=none; b=VjafDjxJPo7GkMlPoCp45Ktdg/hpSdq2E5njKBRdgxhzxSMjo+exSq9dO4BcX95mqkMiKiDew1EKjh8DALy3GDa5EQxihf9decsGCMWkrIrbdRSPaLX28xeqa4j+5chuThfOaZgLSU09o+6NFJ6MSkqK5w2eoUaNgWunHLNHALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783315; c=relaxed/simple;
	bh=fnhTpjbOfuUxzDB1MKZ1r6g3j7DS/B1sgqSc44bj2/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL/dcVkzCNUr6jmVWKQYk5bZcPfNb5kKhidvrgZBKgREHMcBB/NJebH7Uv39GjFS3oqxKgxwYyWdpdyN9HVuFGNrhJf4YTX9nn3inqE8eOBLqxpIpgtC+zpgZtbGJiwlOkAZgGxQsYoWwEKXHIoXboYEpuJdcNTxfSm1/izu8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meYK0uLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM5BLK2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meYK0uLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM5BLK2n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5U2bj079445
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 08:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3cdTTyJLWlDlbBax61FifNHf
	vZeH5kUu35WkAG0ZPcM=; b=meYK0uLAhMhp5gzjHJisxP9FMHRQX0vQP70i7eEK
	hDkogM2UODQcZO8ft72e2rUgf5/2bzysdOYyp0qIcRh3jyoizq/C7Vqf02ee91Cz
	bkhgBjp9FNpUjBOgcogqJFinHDeMNtR9hpK9zB+fXbgkmnE7xPVal6yNkXhXLJAw
	7yq7WmqFb7uVXaPC5bgi/JOxRTUvgR4HfgyGws2RaP6MCNk21izIY3iNRXQieVxX
	UozeMuqTIn2YUF35UZhAcznWLnDYvRxovhEeXN/h66Pr/NeGZ0FLZu7sF2/8GpqM
	Oir5xP73ZniHrNm3Frex1nO0KIP9VLdKWtKLsz48julM7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmabpax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 08:15:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7378ad0so109088485ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 01:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779783313; x=1780388113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3cdTTyJLWlDlbBax61FifNHfvZeH5kUu35WkAG0ZPcM=;
        b=QM5BLK2nk+LF9rL8lkKrbmlE8K7SI5eUnDuoeZHMhgwcgruQEDXGAz9n+MvEyalcSY
         4xPzgXki64FI9z0gG95nrGcrp1MU23Qx83xn/b3utflsj+Mou4mJNEf4cfGZhXlynd34
         gCk9KlbT69VyarXyujfzDKmUD9zYjPWkKUIOnHNBYx+kl5IS44lharTno/hPhXY2Vry4
         JoAt3OSLAQu3j33HZH4nWfoXy/h0MNGO/2vVUyQTNWtjVq6UCt3ZlcG1uqilLsfWpQc+
         2kcYN/Jxk1/CiMe3e3fztridrzaaz4Jcsv05W6RZ8PvAXMCHSYP8Ro7EV2KFcxav/H4H
         Gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783313; x=1780388113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cdTTyJLWlDlbBax61FifNHfvZeH5kUu35WkAG0ZPcM=;
        b=WXrFogHJl8tn418yuVdRKoFqoknNc1aRKDrTG+Kp1iiLPxGOj39elB1ZjW9cOkJwC8
         zTq/SlQcLDhRa3uXu/MQpz4/3qHnaHXk+b6Eh0Lbgfxy4TO1yJzqHI/ko3z/I5+YH8t2
         M8leKoJtUmVRUIDjf5lujXqO1b9BajEeA1UT5y94gMpOUCYzkpARgigzDa4uy5qRg5gV
         fghVqr1AOh1pbdKdMn3JeaC/Ro1NdX4CT7/HUuzknbQdg9oixdNu+PA8XkmSq6hJCCao
         UZXNpJfWGxlwEQb5OesAw44NQ9HTwgY3I4PTxIej+DTpHFZGdKeEnATwo7KrfJwgy8Tp
         47FA==
X-Forwarded-Encrypted: i=1; AFNElJ9ju1nVE8UIUkXvVuYOmYQIUmSvCCwbXYzTZHHRFzkTsxMZjikm9CXfQjMH3rhdsgh4sHCSurqnudxms8DYTdfX@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWcVJe/8t7r3dBtjiEn5Y95BcMFCJFtnOwcoi1vSeRQlmnOUe
	EhHFSKUaLLHwfwiLUHoJ7mAfIbS3Wxdd3EsRbRi/St8X63qWmmjjaub+uq1ny6Ha8yycBXR2zIt
	A+3iX4YIO9OD4UMo5c1Uy6YfJVZUYiqR7rfQYd7PmK13zCg19Chu6Q26J3rFIw4NSYT7O/734
X-Gm-Gg: Acq92OHAkV8nFA9bu8dfVtcsrKU5JNSGpN21ZHE7HJ4XldXullihGkdH1KDShDh42VJ
	9hyXrrrAwCncZVABrkdxvNxrQ7aoBF+jafH9SHFCudZJnj+rBURcTs2FSVxYwMNBaUy0dy7K10N
	uCdzQI0/K8n8nbzejiK2kygV8OFV7/PpbkvpP+5B2HCDXoGETtF+9+RrKzgXC9fbow1YS/SqeYY
	whkRYyim6uAIhcLG++OZtQGm2BbinQPgZWRoBFbQCUlQHD8O6DlOgixbsJeSQWibAEGi6g2altu
	0SHjs0SN0blBV9PWk5huieicuFl+Z1Sy5t0mO5FubNQ7zSwwC5R7wwbKR0bczPSj7peWgANHMyj
	0QpAL+6dozDwMbWo2ZSpS6iqiaMDK+aRCHj08li/u7fdYePj02+LavNFdjj8=
X-Received: by 2002:a17:902:e745:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2beb05e413emr187667315ad.20.1779783312490;
        Tue, 26 May 2026 01:15:12 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2beb05e413emr187666805ad.20.1779783311850;
        Tue, 26 May 2026 01:15:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm120909695ad.71.2026.05.26.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:15:11 -0700 (PDT)
Date: Tue, 26 May 2026 13:45:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: qcom: mdt_loader: add
 qcom_mdt_pas_map/unmap_devmem_rscs()
Message-ID: <20260526081506.lqvjflh7zrldmgas@hu-mojha-hyd.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
 <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a155691 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v5tzlP7bIaCzxq-hjlMA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: T6braCarEcPZGI-fbaKAZp9qiQkBkF_U
X-Proofpoint-GUID: T6braCarEcPZGI-fbaKAZp9qiQkBkF_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MSBTYWx0ZWRfX2ciV+3VgIA2S
 Xqk0S4vHDongmVhXHaLzSkHsBdDN2gpvtWmkyPLlDISqhaC3NLojoapFEUQ75lD5XjEU2SmIXRS
 KdWnjI1pooAjGBckdgdntkFJMKS6s8BpZ1If55lsoL02ceC0sB1Ciondkml0tS1JAzpvG6PDmnH
 ALEEScbBcvOgyzsQ8Xs+f2+kRx/nSpzGzArEc15M8mTG2ZSb+Y1jdWRUl73zLIXO/dFrM+jRjx7
 rPkVQu65x17ittV5sdsb0+zPZ/bsp18VLITuUVXxBuU4LiV1uSX5YPaW6/TIs8apT4sEvZmc33O
 PGXSD/HC2p2AEA5nZ4SQEfmuVKdtWdOxIyGh74LQ9tLiuxXFzPpYkKyKLlsaYo3QksOHBD12fO3
 2UaGe6n8EZSEPwnHSY+CPZ3ol5a1i+J658oojYM3lydU8NwfDuXC8X8BRZaw7zrvBHRYLO/yNef
 MJmIWqJR8il4OfmxLRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260071

On Tue, May 26, 2026 at 09:47:27AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 06, 2026 at 10:31:05AM +0530, Mukesh Ojha wrote:
> > Add qcom_mdt_pas_map_devmem_rscs() and qcom_mdt_pas_unmap_devmem_rscs()
> > to IOMMU map/unmap RSC_DEVMEM resource table entries on SoCs where Linux
> > runs as hypervisor at EL2 and owns the IOMMU mappings for remote
> > processors.
> 
> Generic rule is 'no API without users'. Please provide a driver using
> these functions.

All the non-remoteproc client will be the user., I already mentioned
that video is one of user mentioned in the cover-letter.., will add
them as user once there base changes get picked.

> 
> > 
> > The map function fetches the resource table via
> > qcom_scm_pas_get_rsc_table() and iterates over RSC_DEVMEM entries using
> > rsc_table_for_each_entry(), calling iommu_map() for each. Mapped entries
> > are tracked in a per-PAS linked list stored in a hash table keyed by
> > pas_id for later lookup by the unmap function.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/mdt_loader.c       | 189 ++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/mdt_loader.h |  22 ++++
> >  2 files changed, 211 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
