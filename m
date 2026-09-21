Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DED4973A5
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993746; cv=none; b=cqaF2qxtNvTKqsB0FFBbDldu4xVRgm3ow4eKW4JQa4iNJcJiCaGHtPhGl2rcyDiBuAf6r/UUU7YELv/c6gUr+R/SrNg6Hz9NDwHIzZ1uDd0HhjHnoT88ry5yGcfZE95S4dxD7nWCFWEyl+13Dzg8kJQpTskQtiH30PyVseWWzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993746; c=relaxed/simple;
	bh=OjmJ8SXu8xMfqjFBYQkETIoPpmfq9H6Ub7Xx9JvwWQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFqoD6tCU5oO++uZEAPvnq5VnDnZ8KpaS41O70jjn2K6iTBZH8+luL8GT3+Fn0U+jvhkYJpDccdhPC1LWIoRN67bYazd8mJGCCeQbsri8I0Xgr5Sbg630qMC/FP1qvCt1E9M2El2PBvF9iD8JXRgbEKOvSVd3G/k1t46hw7jgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9GGWidx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfiAlAqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9GGWidx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfiAlAqa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4mTw1129686
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=; b=K9GGWidx9dPwSV95
	GM4i9d34ZGYg8rtiqBH4HBPDcdi7/GJ16cDvfNJTMi5zHncH3PKLuVd+7oNFIFZh
	p4y8Cj9gnLZCVKT/bdRRt8AW3EZtzaUPTiv+AhqEOVyyF8qPSxVCG1iXhe9hQ5N3
	CIvoVg6oVyUtt+ZguhFMGXy/sX7oMuK1KhZ8WBwEjxkOOoseSdHserh7JdOwAXsR
	R3lXOZgj/TgM35D+Yc4ejgi0ELzy//hncX/vKORQaZRVxduKVGv2Aw8gg8W8fyHn
	5WXhyTRhCzJl9dtt14Z1GYOxoJne8RfJvFUwDsMA4TBJFy5Ra+CAliRA830s0fs6
	1IKPzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg9wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 12:29:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso98482e0c.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993740; x=1790598540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=XfiAlAqajyi0ioEPDenx0FkdVcbqc3HirrZJCdj1xokpdmbLhwoYQqgmxWzB2ueRw5
         4aqzD2Q3KKO11BEUBr6W1x1XHjtuUMO+cwB0GNqeW04LsRWgFmWrBC7PJFaylAfFpCTq
         3ujHkQ/DnluKIv6ZcyYHEsKSuldS+ncDY+0yOIfAmPtId8yuJCRl3fa/r/bG86M9MOqa
         jVwWjvk88izm/GqoQc4MsaZlmjrAXdZbgIDr0AAi1ZW3QleKaZRCiteqfbiInOJ5hMUo
         Tb29dOGPAkViJPK6PV0OKYxOB5Slz2bsu/Q/1syWPKFhIDOw2ZaJpgH+2AGKl/CyUqd4
         weFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993740; x=1790598540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=FV9M3gojo2rDoe49iotcYbquX+svnIP+YUH7cVOjOduy1wy+Zhm3vj9N0bs5ZsEBk+
         fxkJrUEswsBm4pefzBd22rUgP+a7CHWIho5tIaLFV1TrfI9l8Wb4rgdEc2KJczDKLbzY
         eLYOhttvy8473S3bDWiD3E5EItPTgsaCplGFygZh82CQIZxZyFY1HO1hmbDhqTKP2OlA
         YKf/ufEi8Fi8EKKu4eVsuTKlS3r8SrWqKMPBTm0/7g7S4z4WNHmkC3DwiHXbbY86enRI
         npWOw0SjYjy2RyN9BJxsW+k70dQQv6Z+qdDrZqocIxDc78FH2YxD6E4j4ks60QID6g0x
         c1Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxdvIUzayoboJ/6/v02bqiVxXixdm75b0KJQ9tja4F1FK84fTN1WwL8qjw8HxTdOvXekRuSYlC+sY2RRxpSUCVM@vger.kernel.org
X-Gm-Message-State: AFuF++l4k9sThuSYQRcKei9xWtT+RBJxDNQf8nL9Ww7V+Puqe2dJhwfi
	85K+/SfSS6rfba5x1HgGYVGfpVVgWlAkpGXC9ILZCBPuUgG5fIfgT4j8Ihp3BdXSl9W7PotlqcY
	vT35aIkGSaer/CiGq+1dXRmyyh3ubZN/No6BX5M5D1hyUkYjRijubesWojcfosl0MWnXuV+FadQ
	MpIw89
X-Gm-Gg: AYBFou3HxQL9m0GvkYlxTKwEFyOG2vYzhe4GwvhP6G0Om5RRqxW1dN1yiHeHjlpD0Ce
	fjNWvo7Rq0626vvrQ2Xo/MfrkxJtDZg47NZpn9NEUZ4vpFYOCwPV9o97nipdmFUdxSgMee+2Q85
	b8PCkQvIXoetZCeOOEZqIpj2cyI0rqVJMa8d8U9XgTf3Z5Rq2P86ar4UX26r5E+iRT+/OQgcUaE
	tvUuHFaKTeLHITMRnGTaR1AGPAiJrWM7Yif5HJTCbufpCv+KaQcwNW/DE+nZnolz5q+x0ksUUIG
	tP3EvdoOP1EtF6rgwLiT9fswadrcA8opOr9nsMiVGsRo5fzL33231C16sEhHIUBQfvpKkJmh3el
	3684Bo6jiecb3uB90vKsWgw==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283575e0c.3.1789993739766;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283541e0c.3.1789993739322;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8cb41984asm1317676e87.81.2026.09.21.05.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:28:58 -0700 (PDT)
Message-ID: <ec3e108c-72cd-4451-a0c0-0be14592e504@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] rpmsg: qcom_smd: reject interrupted channel waits
To: Slavin Liu <bolin.liu@seu.edu.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX/3r6RdCWvbTK
 O9qEcuoICwhrhNZFMsw3iXJOzSOZACInNRPSwvuj2paEyendD5jSg0P5EZ5ZB+y0AmJyTWcGfbD
 B2PhS9gPA4az8Hu6sr2vfvul6EmBF04=
X-Proofpoint-GUID: bHqQ2K_HEqXPX7OgDBSCbvDUK0Ya2q06
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1230c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s7OMwfEDKQn-nhOmWicA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfXwRdfRCjqNIul
 LG9LtWVtirWUwfhDyOpy9jcwdqyjViPh37hti0AIasa9vD2yEXKGTGTyIAM5QlH5+BgGlyYS4JS
 mf6Vr+WcWLMgIWG/tzU0HpENiV9u1J+aczhnocBgueCM5wV+mpfOzMlhdIzdtRK7g8xlumuti0m
 5dky3h7v79iayib1E9tPMndMF0dOO1Z8ozixhrohDfxMpnxzrF1CsK6ni+rQYwDDkYyfuraDN/Q
 2qx0ZJ2e7nR4DDxt1FwV5BzLcwr2Dxn2PyZiMVCzHxna/v2hB9q4m7WdZ9JJJoYHrtjAGDWknzx
 cf/gG6ouT/E8SQiJoMw6aA7X9jL9odBFZXy00koZGZzyrM+gP3VLaUsxy4NesKGAEPXS02SGoac
 JNZOXDpYFfYQcs+piM4s4brCC/b/+1Q5FEpytiXItqkUILLfwAJ2EiOeuV84VAKyxdYdzeI34Rp
 uWbPjBmt80iB7a0nvVA==
X-Proofpoint-ORIG-GUID: bHqQ2K_HEqXPX7OgDBSCbvDUK0Ya2q06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210180

On 9/11/26 8:09 AM, Slavin Liu wrote:
> qcom_smd_create_ept() waits for a channel using
> wait_event_interruptible_timeout(). If a signal interrupts the wait
> before the named channel appears, the wait returns -ERESTARTSYS and
> channel is still NULL. The current zero-only test treats the negative
> return as success and then dereferences channel->state.
> 
> Require a positive wait result before using the channel. Return NULL for
> interruption as for a timeout, following the endpoint creation API's
> existing failure convention. No endpoint or channel resources have been
> acquired at this point, and the successful wait path is unchanged.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
