Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A983CC7CD
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781767; cv=none; b=Jx6Y333wzxkHKd8TcFOCUjQCfrE7jyL4bGUu194B2xkhImBbvCgrnY12HJ0byJgUmQSiXwopWuBCvEqUJMAnyJ21fQ611iXguC03yRKYIK3glOowfAEfSlQOOPgIAQeg17NXtN14DStqKlkJ2PGfHZGEJJ2nP/mEbvINYsberf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781767; c=relaxed/simple;
	bh=No1oh+rmv1z3bYYPB+KNnQtY9bbVZc8ZtbTEvf6fM3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/4ZphnR7vfnKiaX4BhXXRuHyIpqrwD9v2LfT23lZajbZCeisALTVPhd4FrWvbEEOcA7MopOODPivDWlZgC4Y2RC1qJhewMU9jROLbvzKl6QYTP+WVj38y7oWb3rv8PZILVD9wtT24SvQkpwpQ+Qyo/wHMCwtKT67VgnPIYD2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAJTOSRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKcGamHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAJTOSRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKcGamHN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q7a2hH691683
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=; b=NAJTOSRqxHsP2w6I
	dQx6zh4bh+Nax2bycBu4QM3DFfmOyFASk1vpM9FBdOBAGY7/y363n+G5klkwv67I
	/KAIQY4Ui6ouZ8GnlWIBJIaJ6YqFz7+FyGqtnqXLBBKet/cSxGgbC2ssKTGWxTzr
	ZdinhZ707nQRG2YA5aaEYcUSVO2RhIDoT+QEsRjp3pDqeWDLFxSmlJO2muAOD78Y
	Si2AEfJXzWScQlpjJcHfohlg239MsT+EaBUU4zIxoSsfHK72urgbRZ/afEQjZ9Xf
	pCkrYCdUkZFwK3zZzGbIgN+//dTROBkTVTtGjF+N0oCPEfvQ66XLDirqw8Yynjk4
	2mTpjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jysm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:49:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso108633835ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781765; x=1780386565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=;
        b=WKcGamHNpWiMQgl/iVgbT53l/Ufy4CLnYFrVTzcANaIX8GZllxfcbsGkCX+TxxWi6J
         7Brm6y8uqTPpiaOo1jwRbk6ry8jSvrA9bCWSxsn/wOHg99jucjp5ToEU+V7FH+hpx4au
         X2USht1WnKniche/b0YjJJkPvXrmUZyIKW6M8oy8pO0BKLPm4hspyohC543PRIz45eVA
         9IoW9L4t0WbxKeBIvdmTpfes/XhOsOoDD4gGT6fhlzQdiPyVC98oTBN/cHAOH8UWr02Q
         k4bvTrfMKWUMNxRClv4Z6/RhP68ifqjz5LaLvawb62YNqeo3KpENA81Ge+6mIsiC376s
         FfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781765; x=1780386565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=;
        b=Up0q6NJH+P2+RNnzH3z6yXn/Y4Cb2JHTbkPr3qlzkFUOuZ1ousbjlpW9iRmZ/OgR5t
         xPpipHsjMAMYnH1SSOHSDn5+SyBSJswgDhRPQFMgNDA/VLewKMPhho9BLd07UdnHgql+
         ckufGgTQxdorYvFbiupYQXhfyE2Pq6lGpWXRtUk1647evbABa1mb9TH/2HoCuNrAOHTB
         znVdQV5XQx/gKiXJC/Vtpqm+3ClAFiBmbQALIryNGtxs41h+1jF+FAjgl1N53X3cyItf
         kk0fdGz+522SNg1UVhIxHt/WHJbiNh2/wlkjjkiMeGSoDLsmPOePnb64gm0Tbf6U2si6
         jUSA==
X-Forwarded-Encrypted: i=1; AFNElJ9dzDOB6JZvAh4+uHV3l+teAb6y6n+kAOMpeV1NS5KpLtbcsOKr0Nu7FkeWZiJxn9aAfVsLePzzhIEzYNTUy+1/@vger.kernel.org
X-Gm-Message-State: AOJu0YxbFp5yx1qWHe4aXBjw4RZ/jCHub4yqT/5DWbE4GgNvcVjMQmQK
	klLkDIfJNzwFhcziUuXeMOYaYW0smxHXY4XG1kEw+L/YXBMTK+i4w7sK4g7Flre76769HWMK9eD
	bM9NTAc+GYPs4ge1P9otusLoyRq19SoXI21Ubm5eNO/G998CgeqmnkuNLFboCpu8lmF/R2aKe
X-Gm-Gg: Acq92OEKjt7oHKeg7QAE+JKIfPhpNyazsWnQ39YqMICv8h6opWcf7viJCIFSbIN+yXN
	LN6/gk8yAdEn0P/rLf0FXIPt2V6LZ6z6+XEtT7EVu+mZdXHRY6ODhtdVyHF7T8+m76vdHceCB/G
	whjWlb+G4vim7Cw3vAU3B3+hZ0Id5pDoJ7UBj62ngeHEoLQqBQokyHLhOCk7pbtPtHVLI4oDs+q
	TxZwM2A4ksyHGjhKns1V6LGFh+g6fCAQiYoxf4r+0715gQyMMozDF3FFyjC6IsL5fAI/IMDv1lM
	koy3doblQq3x/20x/s7Sk7LmiNv8yL+tUtHd/i1dFu8esBedxBntA5q4yPbH8DZR/h7zUUJ58Kw
	EyChEsoxvZr1HpbZX+9db5+bEqoDY1FfCkQado4QgwrJkJ3EM
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr17603251a91.21.1779781764547;
        Tue, 26 May 2026 00:49:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr17603227a91.21.1779781763923;
        Tue, 26 May 2026 00:49:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm11574492a91.0.2026.05.26.00.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:49:23 -0700 (PDT)
Date: Tue, 26 May 2026 13:19:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/5] remoteproc: Move resource table data structure to
 its own header
Message-ID: <20260526074918.weio2reytcnuziax@hu-mojha-hyd.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-2-mukesh.ojha@oss.qualcomm.com>
 <ahRwlftSboEC2Xw2@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahRwlftSboEC2Xw2@p14s>
X-Proofpoint-GUID: lt-qY52LeR84jaohI8bFyN_y_kHXQs-c
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a155085 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LaNNHw_vc2Zlpho5bK0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lt-qY52LeR84jaohI8bFyN_y_kHXQs-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfX0lUqEdpHF9aW
 /um+kNAK0WHBgyiLHPbmT5BBrksH2uG9haMpQTa3FQEEf3czDgN1EByBqsV39H70+DgafNIoqFB
 CRIDyMflAhjAuedmMmf9mIC+fh/k+vc2QBk8GW2Y4IWJjw6EAcD5JnvGvutHdC3iMV9niEy3i2P
 hgY19+HhQ+2oXyqxvq+Re+LfpwEOTszj+siL59hq50HFoRH7sGp36I5EoHRfpaimbLrsRchS9NS
 OEWfedPeBmDSJQy70L8akGTe9ajBvqWIBGLyXTwAipSdA9qZaQ8S02kKDYdN6g/foKdI9Iysie0
 K3HoFiJescQ3mSFxRc22aIZB+6ZNrUZe6lDo8yQIllBFsLi5VkEb069vs21c4evw+MjHHf6en2H
 HEaIdslMMSssRA1QwJpkuutgpqqzy4stL2m96LWn4476U5FETMmuu3ZiWB9hpsNI+V529xFIXi1
 0rzOP3sZueuCJ3ZB/gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260067

On Mon, May 25, 2026 at 09:53:57AM -0600, Mathieu Poirier wrote:
> On Wed, May 06, 2026 at 10:31:03AM +0530, Mukesh Ojha wrote:
> > The resource table data structure has traditionally been associated with
> > the remoteproc framework, where the resource table is included as a
> > section within the remote processor firmware binary. However, it is also
> > possible to obtain the resource table through other means—such as from a
> > reserved memory region populated by the boot firmware, statically
> > maintained driver data, or via a secure SMC call—when it is not embedded
> > in the firmware.
> > 
> > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > etc.) in the upstream kernel that do not use the remoteproc framework to
> > manage their lifecycle for various reasons.
> > 
> > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > also want to use the resource table SMC call to retrieve and map
> > resources before they are used by the remote processor.
> > 
> > In such cases, the resource table data structure is no longer tightly
> > coupled with the remoteproc headers. Client drivers that do not use the
> > remoteproc framework should still be able to parse the resource table
> > obtained through alternative means. Therefore, there is a need to
> > decouple the resource table definitions from the remoteproc headers.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  include/linux/remoteproc.h | 269 +-------------------------------
> >  include/linux/rsc_table.h  | 306 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 307 insertions(+), 268 deletions(-)
> >  create mode 100644 include/linux/rsc_table.h
> >
> 
> This patch is giving me a checkpatch.pl warning, related to a missing SPDX
> header.  With that addressed:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>  

Sure, will take care of it.

-Mukesh
