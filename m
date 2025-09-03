Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF52030A
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908155; cv=none; b=dKEA7BExUJm25wGdfg8CjKZSxRadk+JHLZ82RGqiNmHFc2jmZDictZda84vQhSgJOv4L0XLRGylidnSFpd2i8ubqGZ7fwqC2G7OcKPr9aLq4ukYvKlrl8/FfeSgy1UD2NLhPIt0IBBTomcHWD747kz2CGFGN7QcGAigh/ep4wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908155; c=relaxed/simple;
	bh=M1LtgKaIxvKtJ+9qrPZwuMH/I9dN5enhPX3YUdHFus4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYaDIXCIKIn9fThRxG1bBn0CVq0RiDFSp4XculkyxRSLq5T7Du0znUvbIxI40tCIrjvRjz5ilL83Tgw9C+XgGUe/0Y6jHJ/3sGnXotQLvE1a0/92OwLvcVfeiFNvd4NIo+6oFEsdFqyhvlq934InM07XC1GZWUiuWFSLu7HuALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRlYdSsp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRlYdSsp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1Zv032621
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Sep 2025 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n+WcvQ74Ce4lJ577+ml0y8UW
	yDHNSNlwkTL36vqsE/Y=; b=bRlYdSspZpKNzm2T/cwtImHx1+fmgqAOO2AOAF7o
	wGcT89iVb9A6IuUdLa5F1mdHTmBJce+mUxFFhS9rAt5Qfn62K0zs5ue7tTc+FZwE
	sdJonU1/V68ggFK2zIWWWlljsdySDjE+G3VNbG2QSLZI1k8a1APeeOkFIxrQJyOw
	49AQrBPZ3tTk9Zxh1GCpS5fRje3OE2HRs0ARc5YwRZQI7PW+wvAkajLGVPUHJkxw
	WayV7c3miaOWdpu6HtigjV2hmyAPpGz9p8dbohnquZhmWT0bFvimoZSgIjgICCrH
	mFpfaQNrU+5MqRwa5DeIqN4oMRcKO9eKK2cbI/AdXf9Hlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33t28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 14:02:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582bc5e4so81302685ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 07:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908152; x=1757512952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+WcvQ74Ce4lJ577+ml0y8UWyDHNSNlwkTL36vqsE/Y=;
        b=QlqYkYDHcreOYf2AN+EZ3SLnPN6+QYtl8ywsywfAT7ekXZhlKrbJmBo5Cs36DP498x
         JNgji1isMaiz6B4O8G003VM9apws3FeifmzbnNTBJeezgoKMj3sfYwE5RtiojV/DQR1D
         MvWQDWfneB3XEAhRBTcDiWJ4UIPHVSgCSZtxurxlPn2LYDa+IOErLqha2WzMTpPtISe4
         EYaox70yJKuGXuk8cpf0xsruLzaUBi6vpUO4ou1O6VBQV2e/ZehKG1GFuPcvkHePSY++
         R8qD0gB+1QRy5AuX9IDp3FRKZXwek4Uw9dOO6MxSAlrpKFl4A29wVXyjWe38nftb5631
         fuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgoYjQO9RISqiXjrBlNWkdN8HNrEFLCCBLSwyLRjbgLWSt1tDnFq+rWAZzR+f9axt7FEoqy2e5JKDO5YU8vnBt@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGr/BTugt4+YQo2An28W6/g9NpL+hKCOo0iHMuXWiWyfrCcx2
	nLET3P6JaueHUFuPLEhN4zdMQ10QXlnd/30vdK5G4i22R8vwLRWSe+dID3M/LbF2kJ+bMJEEFfi
	233reVaCbprZNJ1vcVdtc9JO7Xuxzn94Jqh/o+fokaj939jjOg7Bb4pwtx2D/p/TCVpl6iNGs
X-Gm-Gg: ASbGncsqszRDKNs86gSaJj9tDLejhu2OUskMgUKS2fdCzJsd2LnflB8atuleHMmRxGb
	dYfZO3xKqu07GX3QXQiA4Aa4CcvbV8JGMA0Xb533+jFPpO2OeBZnLLFuq5tXFm527qg+mzgLDxU
	P/19hEFH06YbOJmnKbf3fnr5Df3ViReJZVSCRXarC5mA25ngMga76ahQymdfG3+69q+g8EHqEM7
	5cT0Qqj72spCXNsMdkzdmnGhPCl+4a61Nt+QKoMCVZhIaPVaPF7PEhY7g9l6I1yFGzb0Si2Ft+u
	RRb8UUf18XMtdwApIr2arAD27UouXzqs80RJjV0fwwVyzi9XvPcGQn0VJ3U3e6AA6NkVPwBumE1
	hZrq/2tLosDWTwtF/kqdLfaJ9L7aRRs6cWPKDve2ifFUIPr0gfYsz
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216023325ad.27.1756908150926;
        Wed, 03 Sep 2025 07:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIBrzUehFEhNOQDQfk8OUpugY6wgISvKlXoqbQ3W4x5v+1NPoa7mta8UknLJu8FmxdZvq0rg==
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216020855ad.27.1756908148649;
        Wed, 03 Sep 2025 07:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e53dsm548761e87.7.2025.09.03.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:02:27 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4r1k2V1XHzVZ
 FRyALinmseQwtIwUvQZtMwhy9FNDJqvBXe37tEiUwO+0Wxj4gThHJWC7zK1XgGKTkX32WcpKqVF
 o0XE27ihPQQrTvj1Uh938WnEgR++hbka7K5j/TGNsSK80/biXzR8C8AqgrPNGs8J3G+qyZsrY0M
 +D+ApxMcdEmNpJbZ605J9LPDSKu/4yHwCtoH39Iz7x4fDAYC721mFN06UjICkeYvP2p1qt0iMre
 Ac+yX0rH3XagpWKLfhck50oVAsxTDQoCwTKsAvAzo/K+I5Ema4JmuRUpelL24ClH2GBxuP1F/sY
 gpqHTRtKYcZIfF7xJpNlkFw34net/50Bbi7W6p0bhi2HYwgo2WsssiwQqpWkdrsQJUxK7TTqACW
 oLupdnaC
X-Proofpoint-ORIG-GUID: 464BmauM8WpgSgAtjChqLrEtnNPS-kI7
X-Proofpoint-GUID: 464BmauM8WpgSgAtjChqLrEtnNPS-kI7
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b84a79 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=14clLndLnRljEXVP7n8A:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
> On 03/09/2025 12:56, Konrad Dybcio wrote:
> > > Can you try with this next-20250814 tag ?
> > You sent it on the 19th, so it's in your best interest to run a quick
> > 
> > git rebase --onto linux-next/master $(git describe --abbrev=0)
> > 
> > and giving the series a prompt re-test before sending, because there might have
> > been incompatible changes, whether ones that would prevent applying, or break
> > things functionally
> 
> I can't even find that tag next-20250814 closets thing is

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814

> 
> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
> into drm-fixes (3 weeks ago)
> 
> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
> 
> meh
> 
> ---
> bod

-- 
With best wishes
Dmitry
