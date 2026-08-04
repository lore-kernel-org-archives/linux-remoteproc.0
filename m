Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E603E1D15
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858285; cv=none; b=AusV0NCOffNkqnBd3cAxEsD+SUNa0Yk+GM3k1BPe+9KgSl0WA0bA4SYFOjDKmzfpBcqh4u1ROKI9Tq1v41yWkHOiYmwXxPkpf5II3O2tk4fKEA8snPajn+K+S93k2Z0uPdsbg9ECMJCMCFfEB6uVF5pgM11OP831jdA+zIVw0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858285; c=relaxed/simple;
	bh=qeUgzR2V4Mebzj+n06eQLftZjEJpouhzF7hMMreTTV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frvrFQBPLNBl0Ys8wmNUFnq4GKjGrCFvY9aKjxwPgiqIfipDJVpOfYi8eMVF/qIwu1mtFvzdcL6ikMjn2p8Bl21t6wIRSne+Xm4x1G9atniykw7mjcWgzwvbm+4/Xy6qUq9bbnj+fxU9QfMJndDH0X0uG0a34hg6tiT2ktrLvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwtnvmDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcfy8Fy7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwtnvmDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcfy8Fy7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfUQl1254839
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 15:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hqMurcrA1A1PEKBWxRklA3iOEVv73UZRNF9LWNYHTo=; b=RwtnvmDAOtvMYbGi
	Q9DLQlensFbVH3vo5UvtEoUkAviG9gmwMrFbbFG1SA4dcvCPE2vdq87UDV0KX3+J
	Du1EOryYFxCpEFOL+zGEaTi7aepuTFMaNuQDGmzjc9TSYo6cmYioZBlbWkbaarxG
	c5Uc7rCH1zqxyI02nasBcjgG4Mwi1T/trIO/vn3SSskzW2HKlCc2jwS0rLXTykx/
	E/LygRbBeY4vJnX5AzWFlIkbsx5bf7UMRXosAfkBxoFwc9Ys6Lh0+I1TrFg5+tpY
	yxbn8mwqJbxrduXd/9PXMI5+2S+TSLp72Z2PtW2qE5C/Mutmyc1iT4zrfyiMj8d6
	F/pp9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dhrex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 15:44:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so63357215ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 08:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785858283; x=1786463083; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hqMurcrA1A1PEKBWxRklA3iOEVv73UZRNF9LWNYHTo=;
        b=hcfy8Fy7vzHRu6n2hWpcTlwRaiHvhVPH/nawiCaVa3MvNvWIJ61eXUbu1j/3bse288
         66VE148hY+cdjhj4BFiAHBCpdgwx1FS5IwtTLqIAEU6VvEk51tr30COm8U3m3G7mJKJf
         4CKm+7tQ2Tvug84gKqDr4IO+GXyJbj70BEOpOKaLUhLhycguGYsTmdRFcb0vl1YA9oOh
         NGrOej2fj1f9V+7p1dlp8WIbyZynvM5AeFgtPG2yFYfMdi8U8wX1Z7P7NB5EJ9e7ttNN
         VsypQBPkmc6jD4HRF8aD7GB83TqjTDejwTBaDZtsFRELoWLLzIuu6YKDwYDRAmTVAs0/
         fENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858283; x=1786463083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6hqMurcrA1A1PEKBWxRklA3iOEVv73UZRNF9LWNYHTo=;
        b=OAikUEmDsLvLfHyx1fqtQDExBdsQewZ0UVKA37l78Xs8brhR4A95GSaLnBMF/RE0Ni
         FBNitTwTj6uUXd4yLIMU7uy1QLRqjUkK3XzzoRJ1tPIjWRDcTpl/KUZdBtPgC2I9WMsc
         hbnpRolKkBBXrfvXAHmTKob8CiIxhK59JBEZECiApUtJitnlaeT4pLzXWfhJT9v/BCMX
         VbUyNGhpe9kMWu4rqHM3h1UVFJxISAIzdrHpmTRYAF+/TOU3lcu1sYd1T9o3Zc31e6by
         08HumlJpFPbGJhDLDH5JElH+DgDCrj0CrT8PFkC+JR/0dDbHSqwe6ISZYomp6aadRKOL
         I7Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoU5FGLj7XrEyc5IqpjdQHIg8U1H5VbkTFMq6kEq/dHmM+TmbNLXhnybnacmge74mkNTwXgr7OMsQ4+Dh4wNAk7@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfkc+tKdBfm0lAVriCqalq+jmkxopaHUkymD/sOSXxwpSj5bT
	Vg9TfV2Qnyw3uNwuMa1A+E+6HsPrvm+5gITlbgQiPRExv1gc1UwIcofQzl9/ja8keRPUMwlLvHf
	oUq/R4mYsA2eXL9brAAmVqiuOffJcNGnV3qN9MW8P8C5wtM+AF29Br+o5nEnVH9ouZuoRAMH/
X-Gm-Gg: AR+sD10eZJiOi6xb8pTHWTIJxy5rAB/3YdAvjSI4qGQ7GwD1IA6Xlh3FMC0NNZp08S7
	QfuxXYt+IOy2XLyNYpcJmFa3LaAsBUgX/LhK/2HfTFaK476kG/1rsMcMEt7yQ8ueZzXOwXpLraC
	gP45dJJhjjYJgQj5OZ8oV7AtLiodApY27SuhMfPGA5KyhZjeTlOM/YphRGT8OF33bSmPqUY+Nsn
	ABkj9LtjMt8VKHWFZhlij3YBvsr3dotv0jTRV+1xriVgI0RBIHlF50XuNsUWYtMMnUKR+BgrWxf
	QYDkmfY9Mus3+tP4SD5h5W7yPB91h7iAuuzpccq4mhW7JX7IFdxhzJan+jEy4Jkp41tGiuhgkya
	QKIYG3og8RZOaYz8DiTOovQKvuiU=
X-Received: by 2002:a17:903:4b43:b0:2c9:97a8:aff1 with SMTP id d9443c01a7336-2d0c60c8d9bmr4923275ad.42.1785858282962;
        Tue, 04 Aug 2026 08:44:42 -0700 (PDT)
X-Received: by 2002:a17:903:4b43:b0:2c9:97a8:aff1 with SMTP id d9443c01a7336-2d0c60c8d9bmr4922645ad.42.1785858282442;
        Tue, 04 Aug 2026 08:44:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm8164720eec.16.2026.08.04.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:44:41 -0700 (PDT)
Date: Tue, 4 Aug 2026 21:14:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260804154436.hi2nax5lqzxtbazz@hu-mojha-hyd.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
 <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>
 <am7Aj5UdrrtGUHjA@baldur>
 <20260803090645.d5avpt66f2ahoggy@hu-mojha-hyd.qualcomm.com>
 <anIEWEkcfFCd5Inc@baldur>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anIEWEkcfFCd5Inc@baldur>
X-Proofpoint-ORIG-GUID: ctnHXP3_klaaDUxS8_mKC_HGSxSm_s01
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a7208eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=yHVs_7e9pvbGIAytK_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ctnHXP3_klaaDUxS8_mKC_HGSxSm_s01
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyNiBTYWx0ZWRfX6KcDD1Ce20vK
 EhD2P0+6JHdr/Y/Oy9WL5zuLdFtNwPPOhS7MX4N1HsdaH1L+0VbsVdjSfZFeRtDfdHuDIYaqpIm
 3afqzw3EN7oWaRwGb6wTmtEwFvLYRIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyNiBTYWx0ZWRfXzrPDS0bfZYoY
 pgl19eDiy86XyoMSDuCf3zYIdZH09VpZj3KnQ2HhO1gI0TJMbwaiOG13FVe35KltoGxsuKj9m7Q
 FyTs9OrmsH6VETo/C/rc78rNdp36dGmmOQ0DT40Bf307/TAAGSkdoRORTk1um5oYpZc9BMmvmpW
 1GkTTTdSY8ahsy45hEP9xV+ypSvBVyehPjGPv5aIfOitBUVRqnMGK75viww/VOJ48grpMo2aFCd
 A8wRhmsy/3yu6VyJY83LUUxiY4f+F70t1LSGHQPw+Kr0FTuRkTT2VhTsL4Q4mQlOtzCVYeuSVNX
 6FgToRkSv1Z70+4iRqxX3B6DPXKyyh4ovEsPpxihLsRK96N8AbKJ9CWS6a41n+hjO278KxwbN+j
 Rg7egs4zwNzRPn0vc2NJVqSR5kdoItX9YynL07ijHL0MxkafZZPBhXmmgybHtZm7S9PUPGVk1bL
 4yvHH24WVYSnP3iqyiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040126

On Tue, Aug 04, 2026 at 10:25:46AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 03, 2026 at 02:36:45PM +0530, Mukesh Ojha wrote:
> > On Sat, Aug 01, 2026 at 11:08:30PM -0500, Bjorn Andersson wrote:
> > > On Fri, Jul 24, 2026 at 11:58:58PM +0530, Mukesh Ojha wrote:
> > > > The PAS image initialization path always retains the metadata buffer
> > > > when a valid qcom_scm_pas_context is provided, even if the caller does
> > > > not require it. This implicit behavior leads to unclear buffer ownership
> > > > and forces new users of qcom_mdt_pas_load() to manually release
> > > > metadata, which is error‑ prone and incorrect.
> > > > 
> > > > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > > > retention explicit.  Metadata buffers are now freed by default and are
> > > > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > > > probe for contexts that require retained metadata for subsequent PAS
> > > > operations, while existing callers continue to work unchanged.
> > > > 
> > > 
> > > I presume given that this was sent together with the remoteproc patches
> > > that this can't be merged until those other changes has made it into the
> > > tree.
> > > 
> > > Please confirm if there is an actual dependency here.
> > 
> > I had an expectation that Sumit's patches would get picked up completely
> > somehow, which would avoid me adding the extra variable keep_mdt_buf to the
> > temporary data structure qcom_scm_pas_context. That's the only dependency.
> > 
> 
> How on earth do you expect me to figure that out!?

Mistake on my part. Should have mentioned this all as part of the cover
letter as the reason for the dependency.

Since, we are still uncertain about current merge of 

https://lore.kernel.org/lkml/20260702115835.167602-14-sumit.garg@kernel.org/

Shall I send this with adding extra variable to qcom_scm_pas_context ?

-Mukesh
