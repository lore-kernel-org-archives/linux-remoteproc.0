Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F12629F
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Apr 2025 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590795; cv=none; b=lWL/sEzsyWluylFQN8vNHZcHRMUkI1990ILfY28uBTlEgB2AqX0U6e47sy5Flkdt6J3hTphWiATN5dENjvaFbUZM6zUYjRtNJfoehyt7yOS/gdhVUHtjuP266XQHzqTbMa3YF5JIYWUNIeudB4d3DpdW8AN26hAsAw/Cf1MORtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590795; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIQQYhb+aNZE+mHrdvtLbAejyytX+6CHTGpQdt6+yO1YIFBeoUMOHoVT/YZpi1rqKkPAwuKFPOBLj3ybfiH3twIUwLFYfX76fZpgWY5Ci7kerH+PUj91bll2cabzrvH9++xcOkZ+YRNOZWP0wuBxB59m+Gnxr12V1bAt3aEzGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2Vgt4pd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2Vgt4pd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53293VmN031218
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Apr 2025 10:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=G2
	Vgt4pdZxnVsAuClZyyfvaqZfU+vfuLl6aEgz6uMafKds5uIBg1IFYEyUoke8PlTI
	+VtJ6DmNjy4p2YQtXIPLdEasH7dtJplicew9xFzFWSeFjHbpD1NTlgQoxkNF6GTq
	2Mt0bAt/N4DoQzFVeRTnehON7asfR/80+x6HIZv2I53z/MefFGdj80uyiMsUCQV0
	ke18IoJhOVCSQRPMOHv34KCGNxor+aiJHrEqXdxFSxU8fVpCoj+yxgf2AjIWxMay
	vkPxVJ52I7P9ho2Y7RIXQmsYU/+2STwFktmqLPSDLcb1R1DBOKuCmE1tsFujbnQM
	uE2iiUQzD+M4ffnMBiDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recpkf6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Apr 2025 10:46:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff68033070so11215122a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Apr 2025 03:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743590792; x=1744195592;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=G11Y323Fv3uIAlwMATW8zQrM5tQWKMLTPXxgbWj3xVZeFtDe1Dhl3Tu/NHvMryPCtB
         LC5FrsiTvRq3w2G9dvkL+2ug91kP+567B19toXlomnv5AG5OQZt45rh+ZDfgPuvkBEVs
         dfy6gDWahmd26LTTjCqTDGlX7lFwZUgsHxokmAFTFj9x1NvfZ0uGzQDDTiasY5t/RicM
         EkIaRLmx1xyRx/4D3bonEBNS4xfYYHh1qaf03Le1VBlzeA+0XOVU55wcFA9uL4ks4G46
         ivM2k1Id5bmW6KlXrjMUNxK3+IWC9pSbsQ5dlkDGzcVdpT3YZI1RZisPdRvc/rz1U00w
         CRLA==
X-Gm-Message-State: AOJu0YwBBURr61GxdJqepiLppjb6oN8Hvfy1b2aqSnK1CoCf3RW72PKw
	LF4GdLVvDJK1dcrdBR1HV3+HSf9MtTayKThAIbVa+wWrBqB4YK0BEXI4DQyJrd7Gyz1c+wk6AAR
	EKK3KXGFiIZ/qANPaJcpJeJxRzrBtuWGpDLiqIH1+ytu/1HzqDqHadzgAvoLUIFYPUTF2AwlTiw
	L3
X-Gm-Gg: ASbGnctGQZSaNseDCcxBvWAjHRMPDSAm1tEFK1mSsp7/o4bd0249H5ubZ2xaWUif/8E
	reKuKdSQIbgeu2kWAiwMir/P2eL2akO+MqeqqvkVk671ZrVEUbiycNf+YzrtiS0xjp3dfxqrrak
	2Ydq8R2TyWnPBihGI7D4ldl7S9ZiWP49H5WKPFOccnrCoi7m9nLo+48Yg9BsMax8QFHcV3NqSku
	lu+2YDaxsOpqkUeYoMgg/uuITHOAKkQdzTBzCCFDzWQGZ2qvlUJVhgjZ687/GRodq4X7xwrz5Lh
	EAjiFb4ge3DE/l/sbiy8ik+zsd+4pRYrZnx5nO2+AUw=
X-Received: by 2002:a05:6a21:9102:b0:1f3:26e5:55bc with SMTP id adf61e73a8af0-200d158544cmr10367988637.42.1743590792265;
        Wed, 02 Apr 2025 03:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNA0CW20XcPpWyNC8/CIvouRIP4KOn60bBwiR7PqFuYzduROtHtLvWdxcWtmVdPXx30KuMA==
X-Received: by 2002:a05:6a21:9102:b0:1f3:26e5:55bc with SMTP id adf61e73a8af0-200d158544cmr10367959637.42.1743590791898;
        Wed, 02 Apr 2025 03:46:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef04sm10587969b3a.1.2025.04.02.03.46.30
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:46:31 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:16:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linux-remoteproc@vger.kernel.org
Subject: Subscribe
Message-ID: <Z+0VhGq3Y4P0jAkY@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: Lt2OUVi2wD4Hf_gu_Kq3-d-5OPysVhoi
X-Proofpoint-ORIG-GUID: Lt2OUVi2wD4Hf_gu_Kq3-d-5OPysVhoi
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ed1589 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=tclcd6dtLQvEqt9_mmAA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=417 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020069

