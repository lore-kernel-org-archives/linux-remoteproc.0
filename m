Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599878;
	b=Lugfa1ZszJj3YUIynhm3AacVYSpSiQjbY2cjCMfxtjYCLmCtI2WfAQwP+X+NgUOTdG1A
	 jz7rJuPycGQqB6ri5npqnKLcvhlUsvBv39IkBLN42juiW/sNChJBbPRNtJxw3CypFRURB
	 0e1V7ebSPij2X/LvhFclhsNsDZJH1/G7HDSfADmLc8J8sJrsu/xSNl5nQypMnDRrE3hJs
	 mhhy69+IvPjKxsJJMvcryPEkxCsl2Zcfmr33KeVCs0y1J1TGB6JL9K2FmH1VKWobaLiAy
	 ekgkcSGPiwlA3ecSVKMCLnYnKpA9A5ydFMSuYyA7JOrKEosTtVHVqjvhBDyLEiTDPJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
	b=XqHGxelKTcHoif1Ha3hd437Uw05rPrwDUOHojsFh6YsctIz5b0MD6RJFdtIASHk+sVsm
	 mmbwkW3E7FSqMJl4zyrQXUsVwkBC0R/dUFDXaGc/KPVMkcNjbuZWPtUSwRfXADqkkiDAT
	 Q85z8okFp1MUGpT/zDP/Bm1ukZKztFpXiGTppxwbGtHXRWAhfXXiGetzkbgDPjAAYDN9P
	 fYoB7EKux7ECXgLLhVgMrXsqVja+kmt+wyCPPRtXsqBfOFUL0sUSTr6vptl5LZAV1iPjk
	 15VSRIz7kdEhoLVbC7DTxFOTHXstyKFgNLwhoeIFJX9tQZLLUl7iasOrmvZjv57IBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDBD606A326
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDBD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Tjt2629329
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=; b=PXqE6E4gJOEQa53p
	QdVVWNgKbTdBI5rp8j5cXrl28agabwFVxBDjOkkRuVBAGvYtXcJ/t7WCT6f7y8oq
	63FEnqEe2/Q0AcB0KdPEhlpuuthwKJRv4eoAoC89hvBzAXpBxiLCpcn0U6HKGYXu
	AUao4fFsmRvnnDwvguuhcGTxsi78hFNwVHBA70ORje0JA6dXK9P72APCHxWg94pH
	ybzxmnYXLmkQLrz9sPgCTyXQJ6VEtGfB7KmshZyM8YCxVXe8nuU83FEQ2v0VYtmg
	f1uFID+BjjvEf1Ftrg/9SAsDvGugMmSeoAKmA91ycpe1fNswKEoT9u2gPZyNd/oy
	UO6qjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbgmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 09:44:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so17985801cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 01:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599876; x=1796204676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=HaErge1k3+8mY5mz7X0xKhNMXAbL1Es6ljsr2Q4g9eRb5ujVRySZYWSCUWqshG3ZuE
         KFGU7NlV0GAlOaQsTTpIzH2r0djD5jzbxqSbqkgjnvt/1CV25tCCY66SJ8907KLtotE2
         N7BkAkfBvlLywDKpGr6g5a1zDfPcXGPsTh798ymT+eZ2WOAe6yeoZ2E+6CE5+qZErhS5
         eV3bhQBAy8SYyH2VfMlVzJ9bvfy7SxsnQyr12H4KTR3fXrH/pkfqK9Xe631XgmxKFqQz
         sbOS3XYc/fq9th9AbYj9U4cp+yQ7ifl0oVH4zYizbNGVp2iW/0+rIO+u4/vjBSogOt/A
         bdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599876; x=1796204676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=SPBagLTcT2aKcbC2zqNQ19eeh0k9ILk2MHZ2CHRiR+xjrBWJ+ta1IVpGwAu4srV4hZ
         C9wZueruev9vUoUOX0pWUoQibcTngYg3Nv88BSX98L1s23sKZ4atK/V1irbM/sD/y2MJ
         L4gGpcDev3CYXai0t82EkcDsGzZiHMr46AM2CjXtV7chTDwJ9QcHMkq+6YWMtbuK7d0y
         VVwgKyCRLdk1d7LnHWVe65bTjQ8ftoDp1YMS7cPBRAfPjIziAEo7i+jwXCzhzpYS1Zg+
         AFTrAsT5+EVF0Q2UoMTF4cfbyBX7yoGjg4337oLK9RiE6LbJ6L6X+L5PshdTKC8/AfGR
         B/sQ==
X-Gm-Message-State: APuU4Z+Q3ZvBr/fM9ZvzYdCat8Pw8iKibGhs84rDzu4f5PNkXdmABN6t
	Chh5vrPcseaUB5HOHtz0fPF18ExUiWJibJsqUt8YFqZJwGNkh6tWsfmgP5aon4ZynUkpPZhdbyQ
	+87ZHdePKg9T31FvEdcnWcc9nA/le35iFneOng2kjgxfYnXHZDgFvpxV3vXFnq8C88NH1feQZ
X-Gm-Gg: AZFdTZdaHLGUbqhYK65ZYoZ9RiGVAv/qL9lNmOi9TwfaLU3ZbVUWD1DBGK7EjyHZJhZ
	oCdNPth1MJDWAnGkgqej8TpBc2y9iDn0rZnlFdkTpDf+9IYo8d+7XWiEkTFwZDevmEaXsxdFg+b
	zvHLS4oVuAdCbPOBHzwg+oKYd05YrjaTnP905UfGu5rU16zRRh2D0wzNsjopzBUcC5Dai9KJ0sZ
	303F9mo02M7E0xtd8AGgUMWIOvp+8Rs3ic2vRHwTEJS0tIt7q3dJ8iQYeFb+wgc3DGhJ0vDeuIT
	U730l0oHYEx6ESRj2RmDSTquVLRFNlpxrabGerRhNFnxypQCEs6OfdcrHGHXtEH69ut0o7F7I6o
	5r1qeZePzIdINsJGUzbItgtbYduuWPtm+6IWuUD0sURkBYad0VQ1PYEWCx9DGJ11Hq8azLrI=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14564231cf.1.1795599875817;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14563931cf.1.1795599875414;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afecbb5sm612982466b.71.2026.11.25.01.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:44:34 -0800 (PST)
Message-ID: <3f3978ad-b6a7-4aeb-8992-687264633515@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:44:33 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
To: Changyul Lee <lcy8047@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/2DAQJaRIA/b
 rLXDCasWhoiwfQqt02ZTOxgCQYsyuXXpWnIn1oy6rPdRkwAPvlvcfIQNyCcjOEaBps67yIyjyC4
 epH1QzuerXMdegLfDIpVaezQ0JAbJU0=
X-Proofpoint-ORIG-GUID: 57lb_N3HX4syIdPodbXXWZZ3XahsvrLD
X-Proofpoint-GUID: 57lb_N3HX4syIdPodbXXWZZ3XahsvrLD
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06ae04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=fTV-UkdgZ7qUFQ4n9AEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/2WB1rHE7JND
 7ju7UI92E1cBLJsPg32zAmGVuC3wM1uE1efx7y3xQ1xK6QlEkv08w6HAC21bUfqk/a24a8qf7Nt
 oakL9Kwx9aqauIDeehMtyaBQjbyInsjd+uPDxB+L6RRWDoqa83eFCz1ro9bq+dvJXDvIVMmITkI
 42q7JxmLmpp3CNbecAjI1+ncqZDRlB/nV99a+Sx6Wy+VkSwlouow5T7PM3CIDTsgSNe/UppYZNo
 ejhpSlIbI1IC3gE/VkeCyfQx4szDNGC6hq0w4FradXNUqpAUPk/kYMOD3QfgB9/kweOX/IhWquW
 u34mWumj9YZVmrTN67nKIw6dM+hnWXCnCtfcR5VagGLzsRIIM+W5MuuhVDjZEtHqT2Vl86VNTFl
 z/lKPm4Q+2nesLhWUtdr4sjUEU4fWSBS+m8ie840TL8403mMUgYui7DITE4IgjJSXI2rHuq6c68
 53ZLRVAl9cjv4QB59cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 4:05 AM, Changyul Lee wrote:
> qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
> drops the lock and then completes channel->open_ack.
> qcom_glink_create_local() waits for that completion for five seconds.
> If the wait times out at the same moment, it removes the lcid under
> idr_lock and drops the last two references, which frees the channel.
> The OPEN_ACK handler then reads channel->name for the trace event and
> calls complete_all() on freed memory.
> 
> Keep idr_lock held until complete_all() returns. The timeout path
> removes the lcid under the same lock before dropping its references,
> so the channel cannot be freed while the lock is held. Taking a
> channel reference instead would not work here, because the handler
> runs in interrupt context and the final put may call
> cancel_work_sync() from qcom_glink_channel_release().
> 
> Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
> and W=1.
> 
>  drivers/rpmsg/qcom_glink_native.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f848ab46161d..862565bf965d 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>  
>  	spin_lock(&glink->idr_lock);

This can become guard(spinlock)(&glink->idr_lock) and you can then
drop the manual unlocks

Konrad
