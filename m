Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619959155
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602240; cv=none; b=H3ej/FTwbMAIeOE0mM9XFt5pKiT3k65kwP3AItNkieeQiR03p2IZpKchWk6JPZK1y9JuS63N/z2sTI6eM9CtQQMtNCor/XDrAfVhPSJD3CN3PP+lW4Q938EYiajxusDwtHKeEthSlBy4ASEs5FKrYCgJ5QP8GrAbn/T+XspqbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602240; c=relaxed/simple;
	bh=JytmDMGLzTKJoMiKdr+0XyoSq3ahVx8BGNWgdKXll1E=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Y/AG8q2mSXw4rmek6fkIzyiX7xqYU6TqkczdS0ILdYGRApsVffC4vCGtyVRsljvkQwlYOgH/SekDAms2SpQKY9pZKEyemoiVqYu5cGr35rmbnw3OeYGseEtVTqZBnQBrtmzaHfIAZQTGsSf1EThevkVtUDBRxOftDPYVKoW/nPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VeJnLbji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VeJnLbji"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U6LNpJ005742
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:subject:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=JytmDMGLzTKJoMiKdr+0
	XyoSq3ahVx8BGNWgdKXll1E=; b=VeJnLbjiAf7PioiQuPubnY+Wnh4w1PEzfM/e
	ZBubnSWB4tKjl9QlH3PqbHy+ZEeJ3iA5tG4PO65mTFgSAWoT9Gt+/i+EtUp+RXbD
	VsMX2pcgCkrdhZx8oyqtDNZLaXa6RBZ1Vq+uNZxBNhnky6RnYb35woCc+/9pbfTb
	ezreFQtDd42m21xV5wIjUJn+APhOo1J9vsKvodvO78sQ9mpKsEtvFUizy3GFdQCH
	zc1gEAgk3bXD4Tde3D+k43+ADCi8Xeuniz3qKeO0Fzx61X0pnH7VXQEUUmg4inRK
	PpJ4WLA0/jF4yk0RQbawdDsTii3kPM7Jz1OntytUl47z7lm18g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxsc20enw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:10:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U8AZss026161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:10:35 GMT
Received: from [10.50.3.124] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 00:10:35 -0800
Message-ID: <aa2283a7-b568-4ea1-a792-9342b62612bc@quicinc.com>
Date: Tue, 30 Jan 2024 13:35:59 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <linux-remoteproc@vger.kernel.org>
From: Pradnya Dahiwale <quic_pdahiwal@quicinc.com>
Subject: subscribe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ceLG83c8M145mkZTvU7Cu4Pjj4znrS-h
X-Proofpoint-ORIG-GUID: ceLG83c8M145mkZTvU7Cu4Pjj4znrS-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxlogscore=261 phishscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300058

..

