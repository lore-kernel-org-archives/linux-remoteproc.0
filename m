Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13C28E7;
	Mon, 20 May 2024 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217580; cv=none; b=X4aMM85K3AQ8A5Y8sruYF5zXZN8p15eeAjlUp3w44eWc9Bktht/t1V83sKHJdMScoon5QoZYNvB/Ii2UJbc6zNJrLsSvFwgjSUob3WKTf63r+2vOa3kMhOQ9OMTP56Cg4B/ecjm7H53oUu7Ah9EBVNdfW4t2HKRyN0vcmz5efQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217580; c=relaxed/simple;
	bh=cq2AutFBNcE4IKUuF38V75vCKDlyHWW3DIw4p+lv/Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DReMpYsRiANEGWUpQ+U7oqED4BBH1GbztoEJmARD+xYEF7EjuY4Sh1Rpm7MaHym43JFwF918JC0XImS5iEz8ZPaAn/I/cxxvh2lp6z4T5hJgyBzzmqOj+TNl+IQmnOneF6MK+gALWFrvrCs1E6iVE86soePW3qsztnEvyQ7y7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iLwK1OFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iLwK1OFU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KC1fAq030201;
	Mon, 20 May 2024 15:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cRUbjug0mchDdOc/J9+wic0AfN/3tGGWfkEN3WY8+1A=; b=iL
	wK1OFUAifEAfVKxl0guSZayGvMo03m9qfZR+hZEYXccgrg+1o1Ko1rhal54mnI1t
	trB7SQg7NsZEKjOq/srZPuEw7hwsZW0nECMGRjK5JctdyqthVq+XVboleg2Xhssf
	Mlb0XhfscyC2G1utCfXxJ+zHoMUjpwyUFO/X8qUNF+72uMlz3CbHtg2mukAb3cU2
	i9ZxC+2lZQ6P/dYjaZFoVKgPLXD+IYsL2uDrxcenslkaEFIPzaoDhCVEdoQPhjkA
	W+AIiaQris3Sv24PSqJd3M9vlZWyoT8d4q7uZ4jvDEVcp5GBpJq1QGdLbFLLD7tD
	xlXrbGGCq4HHdGxhzgpA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc3fup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:05:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KF5ubq000394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:05:56 GMT
Received: from [10.216.60.210] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 08:05:53 -0700
Message-ID: <f2b7c45f-d5d4-8a47-26c4-71f139b69971@quicinc.com>
Date: Mon, 20 May 2024 20:35:49 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] rpmsg: char: fix rpmsg_eptdev structure documentation
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -9YZW9fVy6pa1O6N5mdAL-6MV9-yZGA5
X-Proofpoint-GUID: -9YZW9fVy6pa1O6N5mdAL-6MV9-yZGA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=803 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200120



On 5/17/2024 10:26 PM, Arnaud Pouliquen wrote:
> Add missing @ tags for some rpmsg_eptdev structure parameters.
> 
> This fixes warning messages on build:
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_updated' not described in 'rpmsg_eptdev'
> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

