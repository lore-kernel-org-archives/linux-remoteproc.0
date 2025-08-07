Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764981DB127
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754543401; cv=none; b=qPvihvSheVdLIQDwXbK1zHmPMKIdpR3utVUYwjfN7Gsdv5mw0dVtrHDRdb5RZUYcL1V2Kz2JtgeI/nuOD9UCGc12L15UI/jkux5UntjAOOjk914qhmgcOV/JvB7hitGCpDY0rxkKicI8IkWcOC7hYRXsDo//5vDfcJlESwNm6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754543401; c=relaxed/simple;
	bh=Tlr/AsUjBkz+xny+/rpFl7o+Ey8YWX6po2IM+lvkxEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBcTVs34CK4Y0JV9GRRVx9bcq8LwBsUR7TNwcIs6cUfvnNCgXXpEN95cZA8Hi2dOTb3uiadEQGbEydlpuNEQ4NBqMWBB86stz4W5twNMdKllec4KbMKj7ZVQ5TtzNWDfyiw9Watxkbz8iUzOlfZjEFcGsu7Yf6bQEgnBTDeOv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqrs9qkh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqrs9qkh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57724cul019692
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 05:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmXjPpDHd0Cgpzu9CL46gO7J
	+euneT5LSuqRLfgfzJA=; b=aqrs9qkhORFhgqiUNUP0pYhKt1VB6oMXbtys+wIJ
	lllsaCtVARHRehkk2xlv/zI5+koVePpz1iNe+b2INzZibBh7Yi7rE/W7pjymGhR7
	olOL9jaES0sYiNoNsYhRTjye27XU/mHsU5fhF7dRyn0dkcHHIhRCoJrUaPVv7qb/
	tBhJGP+3QysAA9t6Kf1KVZdqSLrMWD+pb/tsoIbJdXvKYlEBGlIP7iGNNxnLE1UA
	pIqUSY5LiyjCS8JsZSwEqXI9TEezGgVPisDefxobZ0i3s846grVh7fBJ5dJhaGCW
	P7MKmhrcytNa2AbShQ8+93IFOZJRLiCohcH8Pl5/C9esvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6w22t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 05:09:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f729bf733so1221301a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 22:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543399; x=1755148199;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXjPpDHd0Cgpzu9CL46gO7J+euneT5LSuqRLfgfzJA=;
        b=veLNDVzvcF95mh6KEFyQoxMkQERpIQX65UxY9eiedkL8Xa/oDY33EwityHUoHmJtep
         Xo2721jeIzUNd7qKQ5u3LPzZp4mo7sZl5BfqFVtD5z9n/sNw4n7QdP6aXjatHjsKZJkk
         oJD11UzqXoahmi3tt+zBpoIO6607qlJHjfH70JJhiKtc8bRgb1BqPFqvsdqRyUJ3DmrM
         dfwy9+DY7nOddRQkfTFV1IFs4F9w8KLYbUhJsgCQ6Hrbzl008uW250Wr2LTWqnEB3Pg0
         jXGVYOdhJ0aFkKdtISlTS3JdQpTXm8cyF3BK5/hDfclY7Gm0bAi3UlHSmk+uCZWCCeRJ
         COFA==
X-Forwarded-Encrypted: i=1; AJvYcCXzr9CVHP9T4QYUZWRg0/EHhmQdsVwx6UCQNbQK3Zo+LtkzmXt0RpupbHvCcBKcL9db1uptVPmOwUEuWWJfzzBp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iBWxSniyKGpBlXLaZZZbfyf8YWLNrlJdGvhSEXUOamtczK2m
	dc6ANEBTO79rrMobDWSTRwWeTsTn8fCDH3VV70JagM8Zv3GxnveyJrAEwUMw9wgbG+3FjA3d3D/
	2MhGGP1U9lNb/sLzzvH0arDenl72SxgmXFH9gI1pqXB761/XErunPVEEGMrF//eXomn+ME60I
X-Gm-Gg: ASbGnct2AR9N/t7gnp/L8qNYRI9mpan/QFjRX88SqdVpVwEcNioHOavodHu2eHTxcXt
	PvbP5EVQALyhbncy99VSA1tq2GviQbMahgO+nezWxv2max4QG11mcw9B8qsNvXwviEUmdxF5tIv
	CNt8V9HHQb9Y95rbX7lKTLY/zMG7eW2aAooZf+k7/mPCJBa5PQm83BxTYySMM15CTRQ+4R7O8Jl
	ECQbzweaud0ueZ3Lu5UIr8z5jcYIAPAJc6aK6yS1ZRhm4kp9Z4+s7PUBPONDIHdOI9cFZJzft81
	6cD9t1RZegpCpGAfl1xJsnLa/Y4X185tCLOH/cyd5akXKTX7GyQnzmJAiXxQ0pjABE0=
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690688a91.10.1754543398723;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47kar2q36LtbPQN4NmJWmgREGO2dRSmwYDlKD0mRi6OR7+kX7FHIYLR3UKacYjpT+SbKlfg==
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690645a91.10.1754543398204;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm14674650a12.5.2025.08.06.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:09:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 10:39:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check
 mdt_header_valid()
Message-ID: <20250807050950.n76f4vtndgjnujbo@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
X-Proofpoint-ORIG-GUID: SkL_sZ_6QpISgexYZkKcBV__u3HBY-42
X-Proofpoint-GUID: SkL_sZ_6QpISgexYZkKcBV__u3HBY-42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXz5b9Ib3xyNGm
 GDpCQ4WRT7NV0FyUzWZnFDsv2pE8VX9RIZyTSdtblGk+pVIGKC4HTxCIqEk5XGeClTPItXGA1fS
 88VclrkRDRX0VQyvcHvaKRXS/5pJt/Qo626hr78MAvLDisUz3V1kMUbhtijU1SEAAeFWrMEHTZD
 vz2sPG/7+iNxNw66udH9A8mIBnNyCpxweRR0ipZYtKiC9S8JiljsDliluWxqOs0Km4qsuMjKZra
 e1PxNWOdA8F2B0aRD9sD4MuNX8jT8tYqUMsMCDNXKf7Usz5EIzZi0dzD2hty21ZPpinuJ4naFto
 D8yCnz4yD8R3AEUelTPnaYr1JGnAyhDoZeBzTIciX1tGWmoS6N2MvR0Yh5jLZeP/XD6CaonMIMw
 rOiQ7/Li
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68943527 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=OaSFCp3QGDZU0s8We4QA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 03:01:45PM -0700, Bjorn Andersson wrote:
> On Wed, Aug 06, 2025 at 10:55:28PM +0530, Mukesh Ojha wrote:
> > Firmware binaries may lack section headers, in which case
> > the e_shentsize field in the ELF header can be zero.
> > 
> > Update mdt_header_valid() to correctly handle this scenario
> > by adjusting the validation logic accordingly.
> > 
> 
> As I replied earlier today on v1 (probably after you sent this), I've
> applied the patch I sent out earlier for this problem.

Sure, thank you.

-Mukesh
