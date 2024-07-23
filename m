Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9313D896;
	Tue, 23 Jul 2024 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721760131; cv=none; b=UsYrDac0ZOREOgD0Em9ehaKxEkvKqu9CYJSRoB2P0TmdKH+2EAUA9cb2w16ppjlkNCD5FJ95jgph4fT5KkmutCpIgUwYHx9q/oisVu90GRKXCg7gL8teQcdpaLUhp9Uo1Or9kHHbUOBWzjSD1DGMDFAAZhGrjPdVETBuxtef41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721760131; c=relaxed/simple;
	bh=dyLNK6AgJCIGZd4AoEs1pVKTjxyR46jbVzx/8IzOeaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CsXq4zoZhjtje09EEv/DZ3ZCFmDPSbA8xV0/fqsWHES6cOOpOPktrBYl2tfklCQiqB/1A4op6awvin4jpboGViD33eHzC5hIhAEF6xnv31LdxAn2u0EEfnsJ1hKmZw7HGWxMJ5Zr98blEJDM8JMLOIqG3jioQvimxLCb3wn2uVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZUMXV9Wc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZUMXV9Wc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N9oFDp010739;
	Tue, 23 Jul 2024 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR0P6Xb4xqYvWQKK08ThbmeBfUKBjRrCAHHfsZyl0Sg=; b=ZUMXV9WcMfG6vk3w
	4pdPckn7xxUlTVWqx5AiUSAT4l+VdadTRPGXq/tLQeaRTuhrO96mczzne3H/wD+9
	oU9QWTF0X9vqE80gXfURytDwbc8bF3WQhvA47xhPUdv3AQSQDVels2+6xezm6gGb
	MEMKUwg7C8Cddl6Af/Tjz1eDLzmyXa2bnF63RQIlUwmwDUk7qOGdEyKLKFQi/BnS
	qaEC/BlK1dK0g7tXRhBaEjFi4oPvtrIbWcxG+jjZ7vNC1I1eHEECqY1TR3/PerOs
	u7zfgUUWGMoyIV/koIvc7OD/S1HMzdU3AkeXIKFeGs0k/DauXlYExeG00TizTXLc
	j3vuDw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgyxjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 18:42:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NIg4gx004920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 18:42:04 GMT
Received: from [10.111.176.36] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Jul
 2024 11:42:03 -0700
Message-ID: <bc1296e1-9f0f-477b-96d2-1a68f3347e33@quicinc.com>
Date: Tue, 23 Jul 2024 11:42:03 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: char: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>
 <Zmc3H6PN8WPpgXNN@p14s>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <Zmc3H6PN8WPpgXNN@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WoE2sRIaU4S1bfBJx1Q6J915mlqwy8Ui
X-Proofpoint-GUID: WoE2sRIaU4S1bfBJx1Q6J915mlqwy8Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230130

On 6/10/2024 10:25 AM, Mathieu Poirier wrote:
> On Tue, Jun 04, 2024 at 06:53:44PM -0700, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index d7a342510902..73b9fa113b34 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -566,4 +566,5 @@ static void rpmsg_chrdev_exit(void)
>>  module_exit(rpmsg_chrdev_exit);
>>  
>>  MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>> +MODULE_DESCRIPTION("RPMSG device interface");
>>  MODULE_LICENSE("GPL v2");
>>
> 
> Applied
> 
> Thanks,
> Mathieu

Hi,
I see this landed in linux-next, but is not currently in Linus' tree for 6.11.
Will you be able to have this pulled during the merge window?
I'm trying to eradicate all of these warnings before 6.11 rc-final.

Thanks!
/jeff
