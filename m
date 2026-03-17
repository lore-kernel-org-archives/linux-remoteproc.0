Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D338E5FB
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737498; cv=none; b=VoPY4UYCwJ2/cjGfa++20QFxJIDU3zzYZ88Q+q9eFMMuUue1Uxv2DyxahI5PLK8Q+8pNlujiVUfLRgITbsiH+YZMPbr/NXmA9+3tIHIZBql2oDOVspVZdb9Yu0YtmwGYXCr7jY3sinrpyNxQrlFTs5DymLt0WemKTS7X7G+cqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737498; c=relaxed/simple;
	bh=4QgBtB8A9KYHumYiqPxwg3Mhj07QBFZK+AfRokd9Gas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKxsiwIIW0sXVs39N34hweZaYEncNnGx31YvnktsJu4rdYDLAZ0IkBEMYvPBaPab/gdCtFOwybSKnFITSuabe//jKhErh3scbhWTq/U1EUT3M6oWVFiYgALMRwOYOJsG37+FL70OqpJFbz7HAOxKr5zdEX0TXEtWFcnEOATS8EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASZ/MVVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCClEhJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASZ/MVVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCClEhJU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H293aS3124560
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=ASZ/MVVeGtJMu1Fc
	XLhAANnTMxH1a/V03vG/LTkSxc0F4h1bFIMtAPhjCNfhnr3REamoVzaRvJ/Ifm5q
	DWpnOtIKVZ2lztx3+oTq0s6N3eKWOBuea9uI0iDZ/3DENDJ2W4IrKaTj0qitnYsP
	PTKVUSzhCM3E4DrZZcryCru4YuPS/gsXqVf5pYvK1u5TnwI4y6JlvXMSeP2McicD
	+oZUlt7pYG43FnWbT6wLNcih1Qj/3DZZC3c8zJFvrpMgtwdfF/FtCG5S9fRhbnGF
	JD5kglBhyIBwiy5g50f9b51gKOOlJnxwyhF91X4sV0+pn+xbASdGOs+h0EFSpdzf
	YmkcHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmmb0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 08:51:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd409so755851585a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737495; x=1774342295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=iCClEhJUF5Dcxya/Kwlwq5RgaYQDlrMdRhjSM+zbkfkNUe8Q2NQjwIb2whshr4RLRz
         i6uA5HNBYbSMy10DqSa+MIdei7aW41WMeE5kz6tuahZO8PY6AqxAkGURslGhd/5EeOty
         8wGZyJ01oDHlEn11oD3IYkpIaWH6PMlUJT4OypKjFfkOtGbhZSWYr0dV7NXE793GOa7c
         MQgjqV3WcrGq3fWPplXE9TwZHfbD9EUvL5inAKAaI2bCdyPoEpqVqrgmpz/lEfF7V02J
         qo81rN324pLXtKJRRPN1oUggUuSlI1CDATPlxnc+khQ4xSK4a6iR1vMd5wjHk0iTTZSY
         6p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737495; x=1774342295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=ZIxhicBCRv3ov4R5AGY74z3EAPMyOeya96R/pJASVZOytpRYphTxM4TTs4K4w+mmzZ
         5QhrjyS8OJnVi1WOM3XpYoY2M97D1ba+ZbABsfcqSwbj18Qc6P44jjH5x3C6NZUnih24
         uZG/977thyfG71CtalkhibUEmd76A7RZR3Sp0BRRGNknAfwRcabK5aT5CuQIu/1/65lJ
         e9CypquPBmuBu2ykW98EmUHlD5i9MlPmfYIScUqjxFBO5d2irZR4moJVdyufz5Ez5+h5
         WNe19qHKKFG0bDvSbUe+uKrmehUW95347v7k86eRRzCQQlC11nRLWg4EvbbfsPwPn/oe
         151g==
X-Forwarded-Encrypted: i=1; AJvYcCXb0vdyHvXjhDQn1nzstCAOjGR4yEIGyqJzIDtL+Jns2p3MRUN9hEnvOX0oTiUlqo7mVh+Undkd+0lw7Xm5Dh++@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBFg3erUDoKsZO/JVCj/6wOuTVbRgWMpHktBQw3cgUJBxhoCK
	I+T773lMa5Go6Hp8G4yJTfFcP67+7UNEjsClqqj08+17VrUQfrATfKqIFbDLw9WEWBScLMR5PFm
	gVsUs94PKWVUxS5V5gsoVIOB6VcESl308+oCfwws5QaEF1dBSbJiMHOKlWWxofCvPV8wN4IQC
X-Gm-Gg: ATEYQzxCAFJ+e1kva3EvApDT+0lMk9Q+9x2a/pxMSbvKF5jSTBoOYKcrJAYaDO+xDto
	u/MA0SIpdC2T9SqAQOfOkzqbfWcmMu4PB+NTzGxbk5sCv9iQYBQgGADHMyzsvIoNznC8WZONAwd
	QbJjczj/q5lTL40EoHPF5GAVIUbP2gzO8aST6UlHCyRpnkW9bnYCYc5hY20FNfXaluS20aJTIiG
	TFnU9uOHXansRIqsxAjqnHhL/RDR3zQ4u/YRSNb7cTwVVH+89RG8JCQRTqEMl9/9dM/9ZvaDLDu
	e4I2VWr5TdKUjaLgvqobFH5AGOoFWasb+bUyG3iX04YHTtsf0Kx93QAn8va2vj3L3REHd/GBxdj
	8vl5x7uKW6G9Q9mu+tyjwbn6vifyJZFthxReHgxf3vR9mTVNO1iwOGRrJfXliHmbbZhSAjB60CY
	7baLatzTuD
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966584985a.41.1773737495214;
        Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966583785a.41.1773737494732;
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm46732245e9.10.2026.03.17.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Message-ID: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:51:32 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Jakub Kicinski <kuba@kernel.org>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260316172251.2d57d0aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3NyBTYWx0ZWRfX1oDur1zvinhO
 cwDCoR4ybm5nwJ9x2LRHcrl5VjyHqHYUdcB5B0X9HzXiPhzuqJa+ypqrF4LWzU+NGriPfekKN9L
 rRuOWZdVB1yJwcKLO+lFV24GbGTabV1jlashvCWWWGp2znh1qF0Z4Jn1uh00ulBWmKBeOhRkDPx
 n3rohpcVsAcedqYzOijS4DojHj0I6Ikxk7P6k1kebW7t6i+VJs3oaUmEILFHcJy7A4qx9vyjH2I
 50pq+2ClruLqWY4IOxZSC28125bA7oJd5KvtS0uE6979vYMSR9Yd6Ck/9e5oWGx31qfdALQJjUS
 2PjrgQQPYirJpMH6EmUGY6mnM0H2Xfb6YboSeizNKdA1bES0I+KNe01wzUqdjELpv09qewPmTQD
 uhib2eeKWdarz7+Fks8xBjBehHiIKrsrxHv0umDSBUF2fO+QQ9srqcjp3KxKAEAn1Ce4aSZ4F9E
 SFk8+CVShnsfQohbQpQ==
X-Proofpoint-GUID: I8pLglzgdTQOcigCYexwksFSEKEaXUIr
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b91618 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=rySjVtX6Rl8zv02YFYoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: I8pLglzgdTQOcigCYexwksFSEKEaXUIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170077

On 3/17/26 01:22, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>> This series is based on the immutable branch [1] containing the QMI
>> service id definitions along with some drivers using them.
>>
>> How a patch can be merged ?
> 
> Wait for the dependency to appear in respective trees after the merge
> window then repost the patches individually. I'm starting to get
> annoyed with all this cross-tree QMI/MHI noise.

An ack is simpler for everyone, especially when they are trivial
