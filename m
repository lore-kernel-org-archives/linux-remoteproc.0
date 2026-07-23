Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2A41A938
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799258; cv=none; b=aiRoL0C1OLryyt9DHB6RX9Iz2tdKGpZumEzBWwGjXeS40u7MrTGXXQxZLM47pWBOoLy1QMCGjcPkwPps1TQokmQ4bcakwOmnK+xPjJxyudpA9ExDRYvkM8b0dv1eZpLRv0ReqEaRZVZ/vWSJhQ9PYwY+PxGVhYYde6nbkE0pUm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799258; c=relaxed/simple;
	bh=3ERx3QEm5vOrtZp45kHOZ2Xl4tp4BshFW+OL+xcGQKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxGgE+sUUlGwXDEE0C6DviUvbiy+RkoMLVrdwGiaFSOBbCbZYTsR0PQ+LL+VHskClF4LLi04DULNddKffbPuQb23kuMDSULOmyu93Y6aHc0g/9aXOIdxoO9yISvSxpgqSCSVC6Z6l/ZHvChjqSahi2l4El+BYbB70Gk8M7GNDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtKbG1Dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REohL8r4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtKbG1Dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REohL8r4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qvp83392627
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=; b=YtKbG1Dgfxa7z2w/
	7xpxdfoVQHDPHg7BwW/FoUJwDpYkEuegAhCV/pZXax6Bbk3OQF9mNH9oLSYxwPLs
	oofKRX/+r9gn1Z/7B3Ss6XiFtjxzeeaxQQb+IQtNwLWb1+Ek1WdFzli3IyphAyMK
	mAQGUBYmGKYmOrGNr8rjUi2hIWWu7/TZb0HaKLxKdrudpF3lDEIbTQfCZWj5O3zF
	NgK+02k9T9bdn3lvTpUDE84HZjuQ4n/SbTtZ5MCZN8UlWgfioAKapkaE3u88fofp
	eS0ScBnJ/qIjZIcuyXhdhzlpqZD8dvPkPmF4gtfGH+JI9kL3CTsQtuUxg/KOpxhc
	98VkIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0krmx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:34:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so969806d6.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784799254; x=1785404054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=;
        b=REohL8r47hsXDXu1HfC+OWVpla+FlQ+ZBXkicdLTyMMctjJ8G5U6tbl9BXtQw3GgLe
         UUUV/eB/7gPWbIytMUn188apwK4cndqhb8Uitv7xpdpwGJ97Qtq8d/EDeA6Y9P/I864E
         Y8i+A0vuwj0wmOYAjn/14i65v/h1k9pXsQKRbFHtlH+0koXwVGKxIftolVMOqVYDibtA
         Wxl3XZy1Mg7wpByYiswzZ+Z028wqIafZtRb47XQZnFFXFVvFgvuyWfhBbo4jabX+tCa8
         ooywDUi8EVjHXa3hE2Z2gEON+OL7q1ef3Qj29qsDpOUyJ4nnutYwlfbwDGGsW3GCAg9Y
         BjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799254; x=1785404054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=;
        b=hvAOK3wWooitN+4iPprl4xC6igihmuO6yJo4p58qwdb+m4Q/M34GAT5zZBm8gdOpjO
         yZFqrjFsL1KSAmdlYyjMXRrnN0k2IqQOVk4DEL9M0jugN/rjrnXC/2Lb/e+W1P8BdpkF
         1iF9lm//c6xr+XaY6h1lrmEnFf0L5fwxk9rNoXvsNpb12zpjz0EGU1yuHv3qKnP/ydyU
         yU2edWPcEIoj10mAWa+rDHMA4MHAjHwhJ1blJ/YMYujLWKn5rU5QPlW/Ysn1cTHryYO/
         sI5NExk3pGhVCbuyNd+17xW4yrLgfH0H0tS2+hznrgeTeZtTgQXhEvpsldBv3BKMZKiP
         FWxg==
X-Forwarded-Encrypted: i=1; AHgh+RoDZdFFU1YjLsEUghHDKm9aOVjUO0EGt2WeiYoTMRW0zIQYKf8qCZJUy+etrhS5hRtcKemz9t6O8xmGexOvhrLS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90ZXotKh86RCPK3HArOYMzuN7gOM1WQLJlI5TGuY/NemTeUat
	gDvba+AT7mx7M2Eik2y4EN9HRX/+CvQJA6JoX+nIWQNcoGmvUVCaBYP6A56jpT20Re+JHG0CeIg
	wkd79K+dlWpIQy6O97+WsNX+JO+GatkeGIexBRFI6M70MHBBu58qtcZhWEa1zDMaHf9bxHNMA
X-Gm-Gg: AR+sD10tNYyPZXdbTcPiBY3v86pKRbRW6lxsPU9EdOa5qby7gjUCeiprWxqEnNME44c
	5/h5kRqyJ3VRsYOf7mGPfcSrsZBS4b7wtnFPPbEuUHC+6skXFcLF7doheLVKixT4AU2pMPhV5G4
	xa0CbZ/+5d1kbGSN1eCYx++lsBYHzltkHeSycOUymszOMbfBd6YbInmPmpGYrxZD787Xnfu2b2W
	w0GhLJCzZOu4d0yJMCauTDL5aikxNWWDQa6GyQs1trfAYq1ywtBqA6EV7FeFBr0eZ3YGljpMMZY
	VWUKdQNxKTUcgpGm+xlTsx/2KQa4RgK3sumkU1vTLL/DMMgGotfuvz/1h3wWguBX0+m6oqBxiy8
	KSgQX2z2BH3xG3H4EtUdRMgPn
X-Received: by 2002:a05:622a:1455:b0:527:7076:7859 with SMTP id d75a77b69052e-5283ded8570mr17983811cf.6.1784799253624;
        Thu, 23 Jul 2026 02:34:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1455:b0:527:7076:7859 with SMTP id d75a77b69052e-5283ded8570mr17983541cf.6.1784799253086;
        Thu, 23 Jul 2026 02:34:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm210300766b.23.2026.07.23.02.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:34:12 -0700 (PDT)
Message-ID: <20c703b7-306b-4026-842a-a62722d96ad3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: Allow shutdown of crashed processors
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6rIz94dS5hMswnl4FjbKFSw4wT9puQkM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfXyeNVKBJIL9k3
 6Ybpz2+nlVbWMdX2Li7e7oTBwdD9fS14eJfZ1Of8gizfXZeMCjJOBmZnXOpjDWPu2SRmwEPRWWv
 HGq6mjB2Rqg0jdKxo88YN+cVtzb/SiE=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61e016 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2pRFMVAohkf1fqEOkS8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 6rIz94dS5hMswnl4FjbKFSw4wT9puQkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfX3Rj6kUqJDXp2
 1aUnaNXS3yc7X7y/vWpnMSuJi6WJUqsVahulqTXqtvt45MYHFUSMdmrJs0fgckGFCNelEdM0NIn
 MkRcyTDNnwQfn3trt/5a8H0ORUEBMNR1q9qsW+JV+dVcykAizOH8t27iNAcPSwq9cizQypD6kpM
 uClkNGlgrJJZsqEJD3USu8aWAdjNi4S9Vmqw90Jp1by5mXAeL1XI7JjmDgrHhI+37mFmTfbh5na
 SYAikWZGtJGBxpAs74c7BpbTw5lfIa5M+3s2vFOzEm9BjGcB1Bof0YT86Ma7aW+1GjFMSCmtIK4
 WJcO/dNxM2CAX9v2CNfpKV91mjT3F6RaL0Ntl0AkS6EKgX3+/ZVVejCjIGnZlz9SQVDs+bvFvDK
 MGS5x3pMuF2q60mJVs3RKGvN8mK4OzVWc2lua83YlNqrqa23t3FDqVbZSmblcEGMCAaVzrNudLj
 vp6cd9sYxeEKTU9KwDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230094

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> rproc_shutdown() rejects a remoteproc in RPROC_CRASHED state, and
> rproc_del() ignores that error. The result of these two decisions is
> that a user cannot stop a remoteproc that with recovery disabled that
> has entered a crash state, and removal of an associated remoteproc
> driver will release resources without first stopping the remoteproc.
> 
> Allow rproc_shutdown() to stop crashed processors. Propagate the crash
> state to subdevice teardown, to allow subdevices to dismantle things
> appropriately.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 5e6a0e05270e ("remoteproc: core: Move state checking to remoteproc_core")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
