Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABC4570C3
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819795; cv=none; b=rJ1imJvm+vaYNhQkv2R5+XvUX+DzqvoD7AaGw5T5UE4Z9gpOOzL026eLQ09ZIEiIgTE+97h+s0GVyCZ2wiAAHFRjfQUiLDP5wncf+KAoeGM9MErXP+oRmCxa7wiOOXI9h3lTdssnzG3sQY/V1wFg9cOI1as/V7UhSqYDlUmLv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819795; c=relaxed/simple;
	bh=9VljpofNjf7N5SHt8GKoqT49v9Bkfg7CwN4KKMLeAIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH0leJTifruSTAZoXj1YMhD9f3bZo60xrLLvYaZelmXio0lVCkOSdXyuiykkZ6PPDPRsmKDtUXRooU9pj+Q1Ze0wn9SojdDuAZ9ngbCAbEj6G6FTgqCOr7zGkvoBTwZ+4dvAoV401rAqvfEfeUqVFRa/pJyRYO/amKFwL03GCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnIhWsGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWcJR8u9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnIhWsGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWcJR8u9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvSug154406
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 15:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3D9k9IuWKG8KzLRWSZ25gx89
	8qBW9qkghsGTTfmjveY=; b=WnIhWsGlRxWxF6WBm6LyKNQQh7J0maVXNe83S66A
	OFr+/402ghA5piH2IZJlAHZdnHoLVjp8U46FE0sJguOKhrz8SufS5Dv27Cidw9t0
	Uxp+0fcK4/56yIAq2OZU6Oy52+DAheXSaLx5OidOGzcHlrC9t3ETAQeUwO5E+NMO
	nwvvo+nWwLVafIDeEnvuvEKIQPg16ympUibN8ApuokJKxxE3kW+6rnfs+gy6EE0s
	UXpkv++kXcJKAKUKljR+N0kjR5A2jWAGi4VicoymH+Tv8UoFwLN1OrzwlpRSncM9
	s2SJajIzqblp9syINPC/JPEyfaWMijWRHprVI+baHLbL9w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b53nbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 15:16:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso1157803a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784819787; x=1785424587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3D9k9IuWKG8KzLRWSZ25gx898qBW9qkghsGTTfmjveY=;
        b=QWcJR8u9HygoVx3ohhBBkynkgiKWUBpjBPCOD6JABHaQmPfstzwp10Mx3TQVjfMTk3
         9Losa7MKNo+F5FdPbSynQq/+4z4BLJPcOgNAUoy4A+H1X565bmHrv21KqipatzlzWZQd
         d/6NAlVa4f3p89Ccb+EqW1nuM/tkWnQB+9obsfJwsnAbIhBc3/2F8JkFvzwXjzyFemir
         xhIhABK067CEmYarrLrES9nFYFlalN/J5qb3h5Vs0q4L/IbPsgeXNqV4eHp7t+mAJlqn
         lYiHkQqjGutM5ofYI3BL2fZocdJeYTUpSQXeJ/Ok0Xtm14PMSkGr2o/GNvS19cxcxc6O
         oCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819787; x=1785424587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3D9k9IuWKG8KzLRWSZ25gx898qBW9qkghsGTTfmjveY=;
        b=mIYZGfprh0MQj8fB+YZltARICrQKcX7emyYBknxvIznd7Ds1gPNlshhh++mVARkn95
         gRX0UVWYTdfF3XZjA2cSfYntdq2CfzAEH24lIZdVmRvofaQynFIeRGSs906JV1ukPPi2
         Os4sDrLbSznlqehpUAg0Ke9Uyc5L62w747w7yyvhsUiK/83+r3OqJ08s8OzmvXq+x0ry
         n8Bkzbtph8wVAwYsc4CDF/HGG94RGSIpCnjmunHEI/+Sl8wDVcs5w3rXwamQv8Vo9vuT
         Amnb+ZhOlMxM2rhkiUFszWR4Epe8CGclaWe+pIVmR16uSBEDG0buIUSZsHg/iztrmmyc
         5VOw==
X-Forwarded-Encrypted: i=1; AHgh+RoFauTPUy+QY6RS1URTiKeY3iuSgJgTNPGQnHEvHddptisYEAFepA07d5C7o670Xs6K3Uo+oF8wS6EuwoexinR1@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDZkTlZUlOT+drT+NuvyYhno409TiUV047GUvmiNmysFR1+yJ
	UGGlkZk9xS2u4Q0GcT5Axf07EPykmktfGpJUP8plWI0eqyxM0IgKCXPkfykove4gVYAcf+bSOm7
	SHuiU+6r9f9ptxa1SvMev2CNKW6+uWHEr8tC5kmz0ySCpqzsXA3VXvRPhzb1RwNDSLBnOI9aLj1
	hTbpqN
X-Gm-Gg: AR+sD13Kk8/lcOT/QGv8S5ZJPaEd24/YDJMAU9tSafxtVm1HjJoBCQQkouxPB5GQL+H
	Z7c7eWMP9VgL40hSEo2XFpgA5znNqaxdzxWjmPnEvuDDwZtUV2wtUHqgUZ5MUdWqhBEnfxw3DA/
	QdktxngcV/vdfILchwiaRbtrEOV6kLSdyRiJezBbHeXzDCaLLpYZ6oFrhv0Y8QIRQll3/mH47rb
	r00yC49qYryobBfa2N2DfBwHgjnMIVEweS30tCvyyuct//HMCeNZpSAm8etYclL5/YwJD8YkAZi
	pGQCUl+nlA1LO4Lsk5BfbiiUT2dd6+PFFcVHzjGmh335tEPdwHb3TEyecpYjasI5FScr9YsKyBY
	XUqbcr/haFiHuBh1moedtAY6as9w=
X-Received: by 2002:a17:90b:57e4:b0:38e:4b71:8b0 with SMTP id 98e67ed59e1d1-38ec65663d5mr3416574a91.25.1784819786977;
        Thu, 23 Jul 2026 08:16:26 -0700 (PDT)
X-Received: by 2002:a17:90b:57e4:b0:38e:4b71:8b0 with SMTP id 98e67ed59e1d1-38ec65663d5mr3416531a91.25.1784819786393;
        Thu, 23 Jul 2026 08:16:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm17563890c88.8.2026.07.23.08.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:16:25 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:46:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <20260723151619.jmlcpjog567tph7u@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
 <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0OSBTYWx0ZWRfXyJTBQIrNqXWy
 pkVfNVlD0PKn2OoP7U6jkRpr0xbi5QraL/W9iSIw4I1Don2PSaxx+bsDoK7iWG/fL3pUkT+i04O
 qS3xD8po8RF0+RYP7Hv7cvD/Y2KFSKjLSOwHbYDoHfmepeur6pYITDJ1hJI/96AZaJEFHaTHTBm
 c8osefLkDqvtdyhxNFx0Q1kW8QcyP0SvQo45rnAXk4nf7rK5zbX+14JV0aexLKNWYiyVJ/A7Nj4
 aKsZgc1gvM1ZlNXpTlYtysWHYnG4OrtmiUvF5waEuLUxB6kxE+76w4idGrmxVFDpGYqPdzUH2nW
 JSAe4nY2kkqlAm0UeHeVgRXk4sqJj/5HDXVRMI1CafLnbyt4qruwqiLTjvFuFLqK9GxKjVz+TKp
 kY79CLVatLeQ5KBbcNi6xsd6FAPIvzWTL1zfa8pk5S1/CSmyaGRovd0EuWLfZDCaQ6QQMO0weVM
 4pKvtHXgVfxpRlFCI0Q==
X-Proofpoint-GUID: QxDufLKeCoUzC6bsGoVA3kBZbHGiyaT2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0OSBTYWx0ZWRfX/YfkONWIB6xT
 6gVnk8zrVqAeQAYBr9w9SpoeVSL4MLZ4wZfAhF/GveSFEs4lnmGVNlNHG41rNT3kXSKMiOGQZzA
 vCL0tXuO03ckfKegD7grA0Xg3TcALyQ=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a62304b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VB_B4jqjWnTxunsdJOgA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: QxDufLKeCoUzC6bsGoVA3kBZbHGiyaT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230149

On Thu, Jul 23, 2026 at 12:09:52PM +0200, Konrad Dybcio wrote:
> On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> > There's no synchronization between rproc_crash_handler_work() and
> > rproc_del(), as such it's possible for a driver to be removed while
> > crash-handler work is scheduled, or even executing - resulting in
> > use-after-free issues.
> 
> [...]
> 
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +		return;
> > +	}
> > +
> >  	/* Prevent suspend while the remoteproc is being recovered */
> >  	pm_stay_awake(rproc->dev.parent);
> > +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> >  
> >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> >  		rproc->name, rproc_crash_to_string(type));
> 
> GPT reported that the rproc may be gone/deleting at the time of
> this print since it's outside the lock, so it's not a given that
> rproc->dev and rproc->name are valid (although the window is pretty
> slim..)

Yes, this can happen if rproc->deleting is false and queue the
work and other thread cancel the work, completes rproc_del() and
now this thread running dev_err()..

-- 
-Mukesh Ojha
