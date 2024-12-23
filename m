Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6701B5823
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Dec 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734976684; cv=none; b=ezbt+1oENkpJcTkhF6Aartq/krk5x/eMWWWeiKke55xCO7Q5yTYY1SELQ9GF7kclio1kI2KXuWZ8/UqDEaX9KSelHaU9wFDq8455DX1KaLpUugvhUlwcHRSALHQFOCA8pYDAXvFC1yqeo0ByttUaJxY7+nue4SPzQLd2fAKaWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734976684; c=relaxed/simple;
	bh=0DBEkvGA47n5vBGvNqml3pVI0DyrfHU94QWHTY29owQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=I8kQyKEGPRGHVYsll6UzbQiP/hxOBfLBykDU/qScPbA67g8VCqK12oDreL6JVLj6l1cHY3X3rzxb+aDpsoi+HC/mkoMC/eAXSh55JQL9dQCvMABd2ft8S6TOegCnbaof/EQjhbQDY7sr4d7vX5Ox9ca5mMiMCXbQcxq1UDzd6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoeeVULk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoeeVULk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNFdc7x004792
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Dec 2024 17:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kclAyI5iPotX5hmyacMH+C1SC/wAuxaeY+7zQL1P6KU=; b=Co
	eeVULk7NDgGwngG6RNoWWMSugTAarFMAC4nbF53CDLXxXdbQMaWpKjffxheJAuss
	//vHnL0m/TpvGcj3D6AxBRgeug/ewT8kxGl79W0sDFG1uha0bkAmp9IcZkOB1w3L
	BURy7je7O8sInE6jjuo0XbvqR7MGovJ2KlhA+wkRDsFVxr9VXfaOiIuSfOBcQJ9o
	7Nz/X4YAg9NMPW7/Qt5i+xHPUQxMT2Rc/rrvHVfRBAE2LXaQFZQc6cswgo5adDjG
	zMALybkRXBfJfmg4wq1mfDF+kQFMm3aMqQ6hX5MhNDrGH2EjsM6dzMQqVjZZYfOs
	YxAA6C7UT+kAJZgo3T/w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qapv0fd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Dec 2024 17:58:02 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-71e1dd4c277so1089666a34.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Dec 2024 09:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734976681; x=1735581481;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kclAyI5iPotX5hmyacMH+C1SC/wAuxaeY+7zQL1P6KU=;
        b=k0LIUPWBT3aC6Vd865l3RTIgs0g+frrmk95MuwBANRdzN7Kmosi+sNRMbZl7tvTSCI
         VtxMFyQqy9ZeA9VUb7sfDKAjSEeGqrUDfNSiKnol11Fusn4GF8yplQ8aKU+o4Q8B9U9J
         qhZywZ9ddkCMojAhGeMtW7TfSupv6FYDC3MMwyrhcTSqpQWWVHbQH3XNejnzq8TmxBQC
         yn0gqWcymgSrdyWwD8Nz5KeahY4brvI7JUd3NQpnqjJpw4cO3vobyT9PKfhMjrZYLPR+
         gRHXjPdliyb3bjqD9JDeca3aZCjfnEziXL/ThrPN4/xx07AoPqMgBEyT7hX+NYLVFulK
         ljYQ==
X-Gm-Message-State: AOJu0YyXevtCyXiI/NySagNa/yFN+INCWUYG9AWbOM9GPXKx7y8/6w9M
	40YT5YU0a5nbsCl9Y8VxJ8Oi05GqFd2qHvlpaa4hc08PTjzYArPlNPVgiypuU4bSJIc6sDs7Y91
	f6sVD0LeGHWUxXo0P5NLfRd6Mkq6vGPwuMxhnIm7Q3Nvx/d+VrVNOSK/h+l1RYRsNFrruWvRXjs
	h2dmdUK/IeA/9KICfdKE1rAbFnGJPP37qgf5fMDRMVPsspH/pUbTRl4A==
X-Gm-Gg: ASbGnctooCSKn/HH7SV3X7TpO+9KA8BrOFa/kk5IXY6MKVYTQ8god1egos+9+fG/6Yg
	13hDPtCfppNOvohfF1Qy5YCN7/osTf8zsSZXe4yuV
X-Received: by 2002:a05:6870:4f17:b0:29e:4c37:b471 with SMTP id 586e51a60fabf-2a7fb31f83cmr8201047fac.30.1734976681155;
        Mon, 23 Dec 2024 09:58:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmJqlkZSJOV1D3AzmBs22VQsrUqBTLQJBJUXadXFR6zNCYupos7xgKFxdkeYmGCqIdiM961QzjzmHDp7xNtWU=
X-Received: by 2002:a05:6870:4f17:b0:29e:4c37:b471 with SMTP id
 586e51a60fabf-2a7fb31f83cmr8201039fac.30.1734976680824; Mon, 23 Dec 2024
 09:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 23:27:50 +0530
Message-ID: <CAN3W6UVqqY1P+0ZV3nwY-vmT3fArGhoF959H_15K3iz1z7shSw@mail.gmail.com>
Subject: Query: DMA device assigned to remoteproc usage by Linux
To: linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ldYGDOesKmfsn83hzijWnsnWZsDUNVKy
X-Proofpoint-ORIG-GUID: ldYGDOesKmfsn83hzijWnsnWZsDUNVKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=753 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230159

Hi All,

Wanted to check if we have encountered remoteproc use case where a device
with dma is assigned to a remoteproc with its own streamid and iommu
translation context.  This DMA device can have a selective DMA range
within the remoteproc carveout memory that needs to be iommu mapped
before the remoteproc is up.

Do we have any example in remoteproc that handles such scenario where
device dma (assigned to remoteproc) has its iommu setup by Linux (since
the iommu is under its control) ?

I was exploring some of the remoteproc drivers but did not find anything
close to DMA use case and from where remoteproc should get this ddr range ?

device tree ? or rsc table ? if rsc table then which among the below ?

enum fw_resource_type {
          RSC_CARVEOUT            = 0,
          RSC_DEVMEM              = 1,
          RSC_TRACE               = 2,
          RSC_VDEV                = 3,
          RSC_LAST                = 4,
          RSC_VENDOR_START        = 128,
          RSC_VENDOR_END          = 512,


-Mukesh
