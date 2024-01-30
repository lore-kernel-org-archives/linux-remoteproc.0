Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F157866
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602376; cv=none; b=ALAwcalXBcrQrNkOBlFmBjPyThgYtGQfv7hfBXeVcRtdey9s8xRDHwOPVlJZS3o2Kyv1CEmWZu99Z8X14z8PP1p2JxoPE+vmDPxjBpMXdA58oMV5urJP8sZ1EXjkUWiTcJDd38iWoNwNsPQxJs9eszx/iDGfABgM7E3584YVFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602376; c=relaxed/simple;
	bh=bTDy2pvbnkAH4pl74X4/8RYttuJCYw74i4jEtLpEBRg=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=DlI34+ZJ3qpvR3moXVO5fA11LQJW81zPkXO4dLRyYajDhBi0UwI4QOLZ4nTQc+CKr87lmksYlDEuywnQZS+PZoO9PntWgRqV6sXpqag7EuSA1aZivX+TzNmUXYEqKZ3RUNIdV+maGpdo4bYL5L0kM6v3w+sTQHv80sDSHEQrMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cumHBxnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cumHBxnF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U3edNV024387
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=bTDy2pvbnkAH4pl74X4/
	8RYttuJCYw74i4jEtLpEBRg=; b=cumHBxnFG9UaNzI99/67+N0elz2lizL9InW5
	0lc97VwM/lzw3R9BTH7cvzafEwHqD/vFzFyn8pbSSz4kdE0HANIyMVaDDyD7vMDS
	N+H7YoMbDsdtZAd2Zyp6ecYl5hHHuVyNiyOTJJVoAkSbA5JW/QjLZGqXPzb9AkKt
	GIFSlJkqV9BVc+Sr07xyYOK5t6V5EgZyYy3samog+S26RWzI+knEuZIl2iTvNEeW
	IYCphQ4MBQoUMK1Ct8VuPZmk972tFDYXoszhXSpbfmj22lFMUhCFlaPzjGZk/Q5X
	Jms9Ojx6+wzlWTaHxplr6O7RUlxcTrFcAvxBe27ohYpvkqz0VA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxhjrsbv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:12:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U8CqXI010978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jan 2024 08:12:52 GMT
Received: from [10.50.3.124] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 00:12:51 -0800
Message-ID: <10cdd8cb-f657-4113-8ff7-d890deec3f65@quicinc.com>
Date: Tue, 30 Jan 2024 13:42:48 +0530
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b9vssgNWWkmmDJ2-YI8DcW8Ery3IvLzr
X-Proofpoint-ORIG-GUID: b9vssgNWWkmmDJ2-YI8DcW8Ery3IvLzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 malwarescore=0 clxscore=1015
 mlxscore=1 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=1
 mlxlogscore=187 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300058

subscribe linux-remoteproc

