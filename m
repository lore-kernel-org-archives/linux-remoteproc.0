Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E12420E60
	for <linux-remoteproc@vger.kernel.org>; Thu,  2 Jul 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995703; cv=none; b=G0KxAzDt3rwYUm11TNDsJIn1aT1xMiWcA4AtQ/7KqZmk7/yh9yG1Wyw4zeNvt+ckP/fnltuzDlE4QEfiFFTm4PF5VFrFs2fAfCweKhVIbsPnRjYvxgxQu0laEgLxNrHROhZRqgAoX/gdwyNRvi4FhCA1qhWeT+mkKQALICbmtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995703; c=relaxed/simple;
	bh=WSd0pp4dLViWUrVNvqX/zEMET0G6qSs6EPp7Yqwc1hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pe/32Cts+alWohR08EiZVd1aOvqvPXNFDpVrsrWz0vwO7ruRL3/JEOrh9u6zxaGGT0dQZjp9ehQe3TddGqXUomvbK0/D7P0nyC9UmBqd9XZAunAlrCleqa9YZO7WF7HyuluiFvbf/GI5j2NjBpPmoaOrVB8bivVykOe3Z9o9rAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfvBRkZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SP6pYnP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfvBRkZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SP6pYnP1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628dDCN3050058
	for <linux-remoteproc@vger.kernel.org>; Thu, 2 Jul 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=; b=PfvBRkZjmzECsBBG
	l/C6ulvrOWW4bO5T1i668/9LoIoIo2Ot+p7CPfZm512Yi2E36QZsz7lY8yGaehna
	LRfeXadKYb+gb6eYOF8BiIUQJ0KAdwl9pBVviZn8WLgczw+4oNwnpFa8J34gtGqi
	3vGn3Vf9jKgZ1GgmG9fyB7AeynvUjvAslZT8Nc1Jdd435VXma6rl3XHXShg4aGn5
	WkgGtwXY9nJRza2Pd6UHqASdWQ9JU6zt0cJqiccbZm6zVd8EjPuoGOfivPfBUfvM
	K+TSJEBYu+SKlIEfYHEpZUKipLVSiQXbKLND9kl0mBASZneU1Ai4Ivq4SxZVPhVu
	wV16OQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vqav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 12:35:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eb5b9d2cf6so3437736d6.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995701; x=1783600501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=SP6pYnP18iMiU9Y1n51fTR3U/5o2/Fi+B+wXOdSOcSr22XdumuVdSxa1JEQ43j7QS6
         06kB7WgNdVg7UIWaicWEQ4j6Fr/gShp7HzVTnaFP8pNwTdwB/a8t2pEPMUfNoiamFPQU
         Uu0NYK89vxsoJZuBSTUA7nqhPAc96/5Oc/QF8mIKzMLjyFYD70YMePF3qClnhqaiIEjN
         Jy0zgnPXZhfwA6aIUNuc9bDOTgfwEIhF4I6a0MbgV6pQAsCwgh+Es6ISNaSB6/2M2WLj
         eNb066sk6Bpb3Kou8T91rBMM02ynWlje2ULRZ4eXn18siVTp7Av66SwdhRLQwhd50r/v
         EFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995701; x=1783600501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=qtY64sA8VtOerFpOnXkFKBODj87nMzTIhHFewXfr7JWMfRp93DWCQmpKYLW/zLHcYU
         F/Ub9uLxpyF/oH1Q7xEftxG+vekrhqxKcyNi3idhG7Jh0UWkk2cHJMSv7sx5ofDc8tyW
         Cc+rWjmc4ea2KIsDExA4iNX5voUBTraA8WapldJQ6LVlKRagegw/+OwEcReLKurU/Ikc
         THxiXBwp0qi2mJvn5iq/JCn4palcHXOqrTmCScurBVNSGVVN2CREVnZDH0BGuK45YWBX
         4zzoyYtAbcrkpLXWUWEKcOUUrvGZWUbKLu5N/xtn4Y8xZyphB8V++70A8iNiByNu/TP9
         B62Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq8tPpw/VNKKv7p0nOGWtGbAqm0HgS15c4CAIoC4zR2x56+Fd3nGoRV1BBjpL6Ni2J06XDNrg1Ob2lgM934Q2oo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PnmFCMmEMzB0+1yM4+GTY0v1TBH/LvaZ+SiNqxLSR1dtaCNX
	qekGs6yqG5MmgT1RgErvhD56rCk0J8WWF1tDHyjTzcZIvUQFHdfFlCJ+ZFuXCtGBMt6Y90hpQ2E
	2aaglk4GjVDFRHqWmAcTRVMS7VRG7ei9TcwO6wuE6TJiD3/j9mmbcs1KDdlvOsFt0CMXQgjnd
X-Gm-Gg: AfdE7cn4TNUOKZKHw0UAeCrijILZuy61hQluQVjKGC4C3WZ5b3ZaeE9jpwgjIP27Uy4
	grVj/TRFfLJtHQYcfWYjOB9+zp3sgilmrmhVYiR28sZno18HD1RkmkqAxAfa4LKMXOxTrlTvGtn
	YryEksID+tGrC2RJrUQ3pVRpZ190M9T0OSjwbARIG20RoMrhs/aJDHXgqSoGlfH1v0POz21FDgS
	ti/ee1wdajwJ6dfLuDwqIuQOfwQiX3+zqIPGcXQv3cDc5lc9H9p4Wo4dtOEVRUDjbc3mVI/Ufc8
	/F19xMY5VX5ujwypoJpwdCaVhMwqMLqcEhuJHfrwkvCaceuoqPetK/XKhlBKeHDgUfQKRJy4loy
	JepL+iqFnC/0Iyyfg+GmbrIP/4wn0PxgqrVY=
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486506d6.10.1782995700699;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486116d6.10.1782995700253;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm895805a12.26.2026.07.02.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:34:58 -0700 (PDT)
Message-ID: <46ab1a2f-45b2-4580-afea-a55073fd29b6@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:34:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TCcJ5iFMKdd8ZdSn_vVlyLJTS_0qcKZr
X-Proofpoint-ORIG-GUID: TCcJ5iFMKdd8ZdSn_vVlyLJTS_0qcKZr
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a465af5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5GrnyDZj1TGYcITIosYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfXyjno3DgLbhan
 LGzGLLwQG7nNaa14u6AMioWTGf6i8+4bl+SSl08TMtfIx7TwE8vzhlM+WSMcPDOh1Esv666pacI
 xZFaKF5kwiz2CqJURLVhPC1dJCoOggXqw7qB4c7hffotNUIB8H66LfzQMJT7k8/9GHtKUXj7lvM
 T4qICVM2okTyONmoZzbG3SvsxlC+Q1mjX5lk9BeMwMEJrtQfRg3aaGW6Fsv6K0pI+TJ0RDeJway
 jA9mulC41p2qpHsn5jACnuUivpFhQQRLl/Aok+DUrkhk7uBo6fJkv6h1qPeaI20d3LSs0wECJFJ
 elqPPTfXYNRUtMvtZZVIs31jl/gBTEdY16XuMHXNWw0h4XzdTqUrNV13mlAUltcUqXpZK4bY+oC
 n/eAOY69B902IqwJRv91Po84wHCJ9WkJb7qhZC/x2DS3nv6Qq0sqs49HmMFOv0GnOLg8hRm4HF6
 zTo4bHTx7eh3lZuVxJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX81SGHwM9ixL0
 lv+X8R9j73+NSDif7dGxN4ydQ4Tqmnif6JPwdo9j9Y4NIyZU/aXjTQEC/XW36ysqxC4TazMhcQk
 ThKWFqvWiekHbdys7e+aYlIZlXjOkzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020132

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
