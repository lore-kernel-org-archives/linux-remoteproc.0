Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852724BC0F
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680830; cv=none; b=riJFPokV8hN0sp+Epxj9hUzpCxrk0p5ps8RdyUql1CT8zp8TD9bMc/QCfDLyvKxmlY5FKs/gF8dZJkqKx6UouAJa8yH76ivsrZQBVjm8D8bEYDzVfMAK526dnc2eTkhnFP3kJ5KvnbmmprrP+cCI9p4dtlIyS37VJatRJILfj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680830; c=relaxed/simple;
	bh=bVCLsaxLXWbChut3pmQ9NWbwS6gpz4qyTGWJxKtSsVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+/zd94Wr5vt89ZmwCxwv7kymZw52dHjmQX9cL6tw4VpT3Su8ydM72sQBaXNbtYwJINkVANsOnWuYHot2fJOXwyCLDFp0QP6xWj5w4Q83vuponNtru766d0QPibssY6LDvZrQIeSrVcLv8PusannX+LsXlfYzhuuYxqS62Ev4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqVpCI2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqVpCI2m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s3tE025820
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 11:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGDDQ0jFQhPbqbOdDbGahC5H
	PEzlI0t4a/oQTJyUEaA=; b=MqVpCI2mqWZp8Lj0wC0y/WMu8WD/S5b1LcuxFpno
	GEwxvFPt8DgXb+0YAkVXre9vkPId3PV4Jj5tYfd1vDK0rhZL/eg0ad99GpaJw165
	uJW0nya9aAYvd7tHD4UrVgohOn9M3fJi6IIN2ybVM9Sh5RZniPcklh8bUXUD+y77
	C9cDQYwcxme3wepARo9Q4lvoBRGaJJQcuFz6GE399d0IzUSUJUkbySk63ZDh0Xa/
	2hZA6ccQj6EpAUiLzy2wA6kuqVUDWaxUZxsuu52UF7Qnp5+Fe00I4rTsb++kQynB
	mmv5SAiFi6WITFVZvGzPUTh8E+n6po2sJJZCaa6o+f91gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x1xca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 11:47:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so113077385a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 04:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680825; x=1744285625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGDDQ0jFQhPbqbOdDbGahC5HPEzlI0t4a/oQTJyUEaA=;
        b=BBMsLw32r32+MHi1JJTMhgQo9paOocxFzX7+ISYeMf24ratl2ed30bA1OgzZ1mKigu
         5f7l3mTkNc43TwUaH19YFnSauaj+JBZ22yUqaJb+hoY8y8O2KkPOYzc5tJo7GbjnPZ4t
         yLcHCwZivBPBZb8P9gd1rT4G4rt1tHmle4xLP2VLFcdmn1M3Rq4ASkNKElHEMllxfbr2
         Ia5SMZsAkQcj7XV0Tgan29s/wYxv4Bk30pFFgGgBq8rRqbgzk5PGpqeY/v4O+0c8cOHR
         OoZOjf7ZU0QZ1nBhQ2/FZwTNYQ9EHcwOQGz66Qftg+qMiKmSG6YW9J6DXFPJMFv1HV7X
         ye0w==
X-Forwarded-Encrypted: i=1; AJvYcCUlbW3iCTR/JNH4wlMfRNxXdAlNXcolpTgEGF/TyxS9IRSpeKnPnEcl7xWuPi0tirlVpIsNF6K3x67gsByFIfgs@vger.kernel.org
X-Gm-Message-State: AOJu0YyzV5H9Bx0WGBzTmweRBaGHzKvLNi6opaiN7FAQChmqwkHYb1Uf
	q/FqQByBMLeSCh+8w9aoHbee7FLXi4U/mzxZzFI/xzyuzS3LSdVlqmnjOy1hnFTVBb20pk8Jw6v
	ZkqUkDM7ynQk46jO7j0a/it1gzseX425E5rly7enSg/I66Jr1qnhf2b5VBm5HnndsR6dIwNaIPi
	7A
X-Gm-Gg: ASbGncsuFCleoQAzXQ6LAsEun4xA9/CAdDzPS9ilkRLIez18RQjO4V8Zuie6+g8SI5m
	+i21QkGDyE8+tSCZUlWLdGnkG+m54YqgcDukuOD0uN9uRymQ9Qa3APQUs9DA5XFv8AW49p3cNvP
	dmBfH3Dwu6YK9tAEVyK+svLqKSUgqI1vnZs3lDDUFSlFPJgzjLMxrmdB27l7iWOpGzdFxQfYG1U
	FyH1Bg2/nH23wgbq45ymHGc/uHr+CTVmBArO3db0ETyTEJhrppylZ+B/K3GF1C+mWCoZO86cIWW
	D6u3TJHrrqWcRloYMXWFzV4LhFqm9NsGYwhylcTKUk+iUkxmerNoo2G0ymiO6db06ck0/Byah3h
	zB7Q=
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231438985a.16.1743680825055;
        Thu, 03 Apr 2025 04:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvB3vmejuvkvpwELxt6ofgBobQEqwcfxb76F9Sa70Rld/6kujkTtCtv4H2O+UpMOZfBwLcHg==
X-Received: by 2002:a05:620a:4081:b0:7c5:4adb:7819 with SMTP id af79cd13be357-7c76df69886mr231436585a.16.1743680824698;
        Thu, 03 Apr 2025 04:47:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab9easm134722e87.38.2025.04.03.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:47:02 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:46:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <3zxqrofeg6b4xewituh3aesixmlirwuy5mvzng74y7srr57i26@xw2w3rvwk2pg>
References: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
X-Proofpoint-GUID: WsxRTooWITloBfTG5Z61kRzD8qEc84qq
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67ee753c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-lOYY9mtbGAmBqhMW_wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WsxRTooWITloBfTG5Z61kRzD8qEc84qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030048

On Wed, Apr 02, 2025 at 01:59:51PM +0300, Dan Carpenter wrote:
> The device_del() call matches with the device_add() but we also need
> to call put_device() to trigger the qcom_iris_release().
> 
> Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This patch is based on static analysis and has not been tested.  Please
> review carefully, etc.  Another option would be to call device_unregister()
> 
>  drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
