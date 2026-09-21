Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83B3AE704
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019485; cv=none; b=G+031+lqX6KP84NWUx4Dtgfo+iqSp1pZOI01w4g5YW7QbnN3dKOgEDw/4A8iPGWO8riGEGhEckf2u9/85P23BqikKZ9dEq0d3HaLh2Bdqw5H9CP5kfHVwWCZicxXfTnQmE5VsYY/HCtXSOYgTR+MF0rAGmJvJ6AJWaZK6xazNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019485; c=relaxed/simple;
	bh=oViEkXVK9OigDsmZPkXR5EFjP711e/j4sF5FEc2sAgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO9HWWCLsFXog5GceJhgkgrHFwfuUGGuy0oSluZCr5HOT7xt+4CeMqRS2LqPUD8SM2RgplusijPN7kBQh0xeyBM6Sexoh/mNVjtKcgrlPZk9Zz1rOxnQI/cpfHxFCBJbo95rfCSveIBNxhCGQYgTPaxDe9kRdpmhyRfHYZ1qajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu5j5FI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4cjDUa+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu5j5FI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4cjDUa+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAA7F827824
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yg8fqfhdOq1FGXzjyINIOF0z
	qOC81zrYO3mOQgWrdMU=; b=nu5j5FI/gFomZKmxRIbuUvFXfm965h/KNeohaYIN
	zV0cr+4EzrDG+2ZZj7wEB9dj01ndT4HStY7awYKvFMcQzwWJv3M4Zte1Mrl5vWLp
	m+tGZiSN6chVCljzf2tmGQSMY5aN1Zjdzglsnq085By00yPC1r0o7H9VrKD+3c25
	EJDwEt65h9QihfPMHQhCMDq5XLo0rexbZMNcO3m0nNmQZe+Rfp4IJ4DBM/Ec/LiU
	Jr3RNDiLTmZZMVAgUqAolRlLOS4+TGRZimw6zL7K6DKMV5XtscV3nUch5OWtKp6D
	/C1TNnW4EtLtcDgPin1RAwdDaS5InSTb/7DEmuU6JrpZ+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gtrm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:38:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8c152622so31052705ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790019482; x=1790624282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yg8fqfhdOq1FGXzjyINIOF0zqOC81zrYO3mOQgWrdMU=;
        b=T4cjDUa+LC2D1Ec8lM6e7jEAlyhoRWwcYJKimcT+5qsSKpqIeXjYSRH7wt0sY40Bi6
         YdMY7cxdppueZz7agcbRTx5DtS5i2gRzOkn59JHmsr73SHV1EGt/JHg4hBgJd/+et3zj
         W1SzpnoMdi16+xwtKT+SrTrYtsTxZU3P004+aVpR2APoeh3KXbN3WcawwT59c12yNgZQ
         uS+VdfM/I/PpZzKwzkzd764cfDgixjGJZcnvR4BDUexB6eveVK+BFoti2mkXK1ZgylVO
         L0SavqJvoWyBHVanWPde1Shgt+ehrUShZnlicPUhvVj9Y/vU0HzA2NfxCq8m89m2Bhfe
         KQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019482; x=1790624282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg8fqfhdOq1FGXzjyINIOF0zqOC81zrYO3mOQgWrdMU=;
        b=pWf1WNn5wKKB2i4ghTihQcGrydCQEH16S77vBVKfVZI4k+oz7A1Ls0wZf2NjEP161Z
         vuV+c85uLdUq9vGBSv+Sziy02DyTKLAT2Tr3qVNibTLhgMsyTTd9ra1i5e/h/6iQU7yu
         sbfEpapJPRfisLwaOd7nQiduSo5nyS6Ro7wV3uC1d2GBW7mTHquagX62ih13e20LEfS8
         XLHGEo9lfpdAEOuz6oZkoUyog5E0acayok2J31s4WQYGLLq7sWiH52TUCnN+/j1FJYl+
         zKRCSSjxZbNyvYgXl16EfHKwHaiZxnNqqDz18kag/4aD8dZC802fQnFu46OMZTMiEePF
         i5Ow==
X-Gm-Message-State: AFuF++lcRAe3+KoW2lho1YEAREiPBNQxQAIfPC9+r/+RrmfzxkTmn+6b
	VgF0qHNdCI2ozFLTtBZpigRkVgZQoE89Ra8uJ9an1x6FENbcKj894kAFb5bZ1w6VwgEMVuAwzge
	7HMJBuCLL00rZ9eVO6hmCeExIqlBRZiNcao6pERQ/ZfjO+sJ7XbiuBTr6WiM82zZVk6p4y34b
X-Gm-Gg: AYBFou38BqEW1VcS2p/fwAe0FUmTjzWKtC7BmnYb6hJ16pf7yhMmDwJcCsea9cyH3ii
	cCZPwVtXuu+udCdx56Knn56uZcna240N/MFruqLC/GXgBGPzgvlEdgp1TKMwmX4OZyBWfOdXumY
	5mZUvJdvOj1oi+RXnL6RrYaa83HDx+TogzxGXtNOWUC+l79GF6uvXA3YdFpnjafkOdp3WJ0+5+s
	MiT43mNcX2/eOSvhEZro1ed9o5rOClA/g9iqMYtGMJ6SeEY+c33jQEa/VNwgpUulqo8j/OllHIK
	vcMvpRZ3FCEo+6TTKBXD//62dL0yMojAqOBR/KufQU2NEYBKMi8J77dmMqFUmycDr+uRrkgYxGu
	u21/Ul0sw31zhNeNCCpUNqV0Tqg==
X-Received: by 2002:a17:902:db0b:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2ddb16d5a08mr177252055ad.0.1790019482304;
        Mon, 21 Sep 2026 12:38:02 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2ddb16d5a08mr177251815ad.0.1790019481787;
        Mon, 21 Sep 2026 12:38:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebcdbd8sm288669eec.16.2026.09.21.12.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:38:01 -0700 (PDT)
Date: Tue, 22 Sep 2026 01:07:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: fix wakeup source leak when crash
 handler sees RPROC_CRASHED
Message-ID: <20260921193754.2ulkssymszoz66oi@hu-mojha-hyd.qualcomm.com>
References: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: ztvKxC2XlnMSA5KFb0QteQEHAlscKVIh
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab1879b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W9w1WEFyLmScbr2sSkQA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI4NiBTYWx0ZWRfXx4LB6YHISMJb
 nIvNdXsRu3W/EccipJnQfW7WzMzXHxvvPLSCjYkkqoGJ3k76jl5Wu6SHB3sMvJ9ZZRUmFQYGpD4
 P3gXhwm7YqAO3CGgTUkctr+Cg/sbOu9XU6lB3+cl3DxLZKLwdMN//qG7Dj4S7q5rtIX/p1+qxbI
 J6uL++k3mLqUvdXOaoR1S31M8yHN3P4tW7bTjvNf2dDf7y9iiJkkBvgysrY6Cq/31Nx/9ORd4rG
 0iMnhkJjYE6Jz4VXtIwuwGjsiFs3CAHf+5DiczWbN5xk8nsuRRTFkei/NbGycQx2zx9LPJltqqO
 eI39y9fOR9HmllXJwJ3kBnMs2y4xUoqXjrQXIJza3BeSaqCtLndlhwescXIT0YEkbBuXlfIgPZi
 BFzf9ODRXVuG2pvC4gZ+57yyScjzYi/6e89GKWEMhLaKYJVScXe/mDPQiSHb5B8VHMmWc+CUJPs
 wR5kXUVYc+o47Cm1n5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI4NiBTYWx0ZWRfX5zyTJG96h/An
 EeHBOO4x8I3enqHw3afFa6xDGUd16nC1wu8azQi5rKaIEof+vG19GGBfkgdhNQDY0RtkAqu0st4
 nryQikMsaEV9CHiHpZFhGGwUi2ExcKc=
X-Proofpoint-ORIG-GUID: ztvKxC2XlnMSA5KFb0QteQEHAlscKVIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210286

On Thu, Jul 30, 2026 at 02:24:35PM +0530, Mukesh Ojha wrote:
> When rproc_crash_handler_work() finds the remoteproc is already in
> RPROC_CRASHED state, it exits via a bare return, bypassing the out:
> label and its pm_relax() call.  Since rproc_report_crash() always
> calls pm_stay_awake() before queuing the work, every crash reported
> after the first leaves the wakeup source permanently active, preventing
> system suspend until the device is removed.
> 
> Change the bare return to goto out so pm_relax() is reached on all
> exit paths.
> 
> Fixes: a781e5aa5911 ("remoteproc: core: Prevent system suspend during remoteproc recovery")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Request for review, series still applies cleanly on linux-next.

-- 
-Mukesh Ojha
