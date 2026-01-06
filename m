Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF9244667
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715910; cv=none; b=R5WERKED/sW0vzPb1hbzednCy7moxQmTh8YnNlNNc4U691u8RxJ1glPjEu4Y6oUYpPhHoLBv1bpObQ09YpGVROoQztt9qbb4/6zApTePyD7+rECv+BnlgO7RFV0qBG1KByiwY5IFYf7zGXMsIXdUDcDiuzSag7YLUjHFqkG/HiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715910; c=relaxed/simple;
	bh=kZAtNkxcv9VwF6rLzyrF0CTBPBAllpQKs44XUlqYna4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI9Ndk8ri8c0p3W3eqr+xWm5QxwLakAupF2VIeJ1SyxjD/gdVagVoG/wpD7Nyt9WMDCEDS0RmQ96H7YzaKvpuxLkdUbhCbqlvhUU5cnUz1ctfgGtmGA8zucqR9d4RskK9LZCSv9qJxyb18gkGtOB1in8h/jELRmdPu8ZNU8Jayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n97YMzi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSDl0Q/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n97YMzi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSDl0Q/g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AFmnS3271888
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Jan 2026 16:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J2OsZw1mwR7uhMWD2rOzlNZA
	sP8urNJZ/6RGPdx2j4I=; b=n97YMzi4zW304AEXGQq1FGYV/gGV1YdF7qsOerHC
	7Wc6SUTcSXTOQBJfikCK9WEpp2SD/YNEO7UlUNhnP9PK9NQi8k4RgBVCZEWZc6cw
	68I+cDm2t+XnTQLaGWZr4HsonFU4tXf2+3qpAPwwAg6cHN+ftrWbRZ8ooU48UuAm
	dq1YFAWdp8oGxX3yUHbepp91UQOOTwdpaxULZ/7PochAjsGVJjdcKgwcIig2g6/W
	72279bQVHIhA29TjRgGCKhxC2mBy9nfxc09YhHZ2/mj162X3iahx6G6pPnfh2J3g
	4mLhSpSTWiSWewWGIg8I9MCQJd00/yFqW0xobQyxQSoB0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv03w6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 16:11:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fc0d0646f9so43840011cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767715905; x=1768320705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2OsZw1mwR7uhMWD2rOzlNZAsP8urNJZ/6RGPdx2j4I=;
        b=ZSDl0Q/gYMe0xyZcszsUgltyoK9j7tZaq6I+h3z099fl0VJ+Fe8VUgA0obojxcxbxx
         ucNs9FaN62Pg0GU9vzgJsloig3mDYPJcHEWkrRAZiwcw4x1BT/QrDnirb8QrDzhLXIXU
         e2RT3neJD9yqkYMJUhxlyfcDIFlfQfjT4e+xwIRN3ivmc7EAoYXXPYJRGbjarEcyEtzR
         7O8ZiCOyOjhwV7ff2o2qPimbTUjk68hVjZNK7MpVm1mRQuALbpG06fiqk/z2nt1RuaoT
         iDcDorYPpXm3OpE0RRq9JxC3XsqSf9yhN2GhullH9ORF28zO3xzgAj720QjeJdUoLGgU
         7sTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715905; x=1768320705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2OsZw1mwR7uhMWD2rOzlNZAsP8urNJZ/6RGPdx2j4I=;
        b=cBbJIeBk4t4JQv1JCYU1N/GsAFClsPi5RKL3jZwob2nDO+g1zSAGtMm+uzH9obKc+Y
         eWMUZVvMn5I3EPmpDZmzwvdv9ZQK6mDW4ZC5O1NCQMkmlHEJLTpasuQeDdQCt2tnDD38
         OqaDeqFqSrXPbU1bh/bDIsMXHYuzngEEAN0xa0asI71hYHdhIVvucXlqdexmobm4XepT
         wP+m9OgEloqh3io//ZFkJ7nOLFWtw3NteSodOMImBMccj0TsiHQ3pKKrcwW28QQkVwAU
         ItwV1YxWLz7Am3T/IUBz+I6kekHXBlPZrSBEz35tRf1xAieF5AByMiGN57MInls6tGab
         PLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUgbJxj4UYuV1rgzLemUHCZ6rTFb6P+euokSz9PvwQ1JBhWVjzp1ushgUoEsf0e95r5K6eRp15UCIOb7GMx2GMI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkdjWC6uvT1QoBHeF/mey04wNVf6yy9APhflOEiToykI9G+yx
	H+Cw2OGT1aK8oTi6HG0BbncSHVkDS5GONE0UfKHi71+AFytOoamaYAasQvBaKnJbfcyyOn3bHQY
	eOr4WgemdCI2l14ezLjGq+a/olbRx+oypipJ6XIAyUwVBgYHbCOgX67OGARQtGfngAis1oQ09Xv
	b+Ezst
X-Gm-Gg: AY/fxX6S1S7WwPDl7Tcmml1QhZTDpfHc8fjZCbi4SKzSWCnlOpGt/OALQKWX85op7OU
	HI7D2TQ/9mE9YAizsr7EIv8PSDlgjLjMIQ6wr56FaLnPBZURlV5lpACQG1q/7xBNm6WN7caUYjY
	y+DZ6sOPW2Px20sQ1tnNbNXL83mruOm5LzuKIN0V4UjwnQP11JHohCbAwfgp5OcGSePmHukB7ci
	E+VnMtw/mCjezEoyh/jObd7l9t5ptqf8G2x3n2AVRG7NEIPkbUrN2a9OwtHuH7JD2sdmrSJ9MCN
	kWWUrpQfAE/e+CZKbKhJAQ6JYLWSiDek5oH3lYvu9UTHX2st6KQ7xE4Ia8CXwNd6EtvuVAq2n2P
	89N/fw1zdsVOQ/CEXCcLk3Q60b72HwIT7XM7mg+aYqzfgQU0ve17/Qn11jM1PaB2AGCIkfjB4ut
	IV6bIoIpMo1M/nANG31Ygldqw=
X-Received: by 2002:a05:622a:2505:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4ffa7822b09mr47889251cf.73.1767715904753;
        Tue, 06 Jan 2026 08:11:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJimvHir7EfJnUsNQVjQogGub7Vv8k8sPUI6byhYtpLHhCYNvjMIshMY0ypBffsk28UYXAJw==
X-Received: by 2002:a05:622a:2505:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4ffa7822b09mr47888811cf.73.1767715904378;
        Tue, 06 Jan 2026 08:11:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8e7sm678067e87.18.2026.01.06.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:11:43 -0800 (PST)
Date: Tue, 6 Jan 2026 18:11:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v9 1/6] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <rpijefy67qokw2ehe4iv6msewiwayiqdz7paalgspg4ghjwzlr@7q6gdoohuuis>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260106105412.3529898-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106105412.3529898-2-varadarajan.narayanan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695d3442 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EDSBdl3HVflM_WRIKtEA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 41J5NhTjBRRA52aodJaSSYdhiFx2Buo_
X-Proofpoint-ORIG-GUID: 41J5NhTjBRRA52aodJaSSYdhiFx2Buo_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE0MSBTYWx0ZWRfX2XCOkpuGh94g
 2xhE9RLkjdHoH9VVZmBEZWVDjxA5yP7KgYPyijU/bqIc4Xx2Wjfluvm5gQ7mrguhK3E3bBNoSWb
 qBXKvZ1MiOiiSVrljRdjOHGjSSjtDHcesquzU3Ox+N/kA1zXOY4LCIahpDves7wIvBn66mJheFJ
 Jhh3j6WvWEfEKo0tSLS5pQaNiHL9FWUz4Bzvyj+QKhewcQUJZLJNdqug/fDU1K5UtZhudpalu4y
 PYBQH0iWKwuy/dS9m2B4FLL7UBhsiG9WZsOmOwlly2eErglmN5Hlu5+o1dZSpDurADf9oEmeRQs
 00l6OnBWRafYoXSB8VeIMEGQxCbeOCSJSnRkN1IP4yvbirfSNDcyMpdtTU1R7ZOr84O+bDmIVqe
 iVLa9RDk1dZvjnnVsBdlW0f6gmHuyXXiYmpoKb8TY9wqxxn6gmchR7XG5MUyugVWliA39weYRbA
 oqDnWfb60UelkjzVaIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060141

On Tue, Jan 06, 2026 at 04:24:07PM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v9: Added signed-off-by tag
> ---
>  drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
