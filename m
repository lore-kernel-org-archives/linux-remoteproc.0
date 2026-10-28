Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193085;
	b=C52u33EZNgwn2Xw6rTm9ob3O86/dwNjghEDXDT8qwa6x/mum522xWz5nWm5m7xocsugc
	 98IktXXXqqxYfaVH9Y0zmpmUb8MbTns2WXCdxoZ1Vjt9s5Cfx0n11IpZzJwicoZhlbcmC
	 VZ4OwSGK0BBFNhsUkOVJlSP3aM1e0nbieFEBJ6xdkxz80tpy0MIwwljBT033OpIv9tv+r
	 j04fzeHs+L4igLPwe8NxF3ivnLZZ93heQgjRCbSggptVWzG+IKQv44l4wyaULUTQn5xlE
	 /2I4htO2I3rWvTW0AIg9J6JhFcTjV7E9rKN1bD/0+cyzVikh8Ien/5VA+Ba4wWNxndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
	b=ZAQ661JdTmidvErZpOABPtnp6B0QOtRNV2H+PYV3q6TQGKZACFGpBbOqFcMTeb/OB6wb
	 QIpf9LPlM5uTNaQchNYpYNyK41+MDKMFmoAFJXo5bRXWiN3F6gL2V0KJWQZOdOqu2Db8z
	 hxPbKfcrMN1QUrBGZfsXzq3TdQ08L3rqyHIfpl1+c8QHof5r9oJ1SjF3yajkmlH+9pBIL
	 B6zpnMWweHLzT9Ny+oJgSZwXRuZaNzV1x43XDinUXiv6cGykT9NBmXTYDQ9AcnPOMcFVB
	 BurxL224D4mKKAHaR9ruMmwsIe8ZDK9HzMVstPLr8WDQwoOR6QJDw/r7P8Ulg53ngVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDs/SelQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0D606A31C
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDs/SelQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeDV32082734
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=; b=A4KU+NdrY5SWcHMH
	AXdRRFZ8KYnGZdgJm/3Ak9itR5CUTDWPK7Q/T5779I1OfCGJoUIQUutrJYU5ChC+
	xGw/OOvy2MtG8ehXdN5ARNhAYnDqxXV5ZgAz2oFacTqj4tGv+98RKqwnCsaPeNwM
	+1dnkwpZ4pa13I4k/BXc2MpknB//bSGRZ28XcVB8pKolM8BlaBm+HD7Z3mNPIGhH
	MA7H7GFMI0/NrJ1uxcMlrKsQsWYm4xajrF8xO9IQC54zpDWm1Gvz8D8mUy3mPsRU
	5Lv97QuJDyCuI3JE0rb2H8EabK0/Vz9mMycAdTKQ3QgsYnAiNKJ21c86UONjMwHr
	4IeOrw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv48v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 13:11:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso48853e0c.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193083; x=1793797883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=JDs/SelQPxnsIF6VYKq/R2bGxs7amcNTNX2a26zG3WU3oGFGe0VUZI/g7OfsYDRKxg
         mdkeMt3IMkpPWZvAcQCmIMAgaZg2E7a8Gxw5Rg/2vCG3z+bQKpK8WerDRaMgwU/FvXzO
         wAWM/SY9oYIiwiH5a76mbPqE4jhHonShuKdxIvZjaCsgPkbmVAvoPqGlBNwgPbAgyXS4
         U/7LfEh3A4iPW9jLG3f5qDD/9gWGoNEnD4KrSJBUKCqllLNjqUvBt0EfINcz/ywgutG9
         4dh6NnJXAD9wp7kkk3KT9LZ718wKq6AVdG6zKdkpxttcZjnf7mKrXqZUYu2lzsQ4dSgC
         lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193083; x=1793797883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=zBDmZl6rYz93/YSYL1YFVITiv/mShAuh+7biZMQt/LdP2bSv7K2VYH1wd2cFpYkA+P
         BL0ECsCme5JGwMg14MP7T7TxaORsGruDyUF9+AAzD/jzWX1TS5fag6dNtOxKolIt30vf
         JO4B8bSLemf8ONcaH/TZ4JbMfuGAgR2LxgJ1vopFhqNBP07WhclpigCrtOBzruABet+T
         rMfok4rWVvSB5SBmN9jy5jmSjYz8AEa8t+vAxCk2oIr2qP4yMTNFT/mXiQhiGfjrPZVz
         pMKHLNmCPsvztO7ecBQAWWj0MZWM6gcKUosfSRvCUTcrxxn0cUl69HSzEPflEuGzjKqI
         Gvaw==
X-Forwarded-Encrypted: i=1; AKwUvBwl0vgYiCegbJSAYD932DZra/zHzNODkhMoN+uuPR9d/oORE4gdhODlmhbisq/7IqDkJKBHXlCc6s4J4mms2Dja@vger.kernel.org
X-Gm-Message-State: AFq9FYK6IuXSjzpqMAyU+27ZySorKAhrKgdXzGNyKvG3rQjMsHs39OaC
	3W0TGIXh0B5EifNB0kJbtnKmZMFs11JcAmiSsBJzD3Ud7kxIGS03M5Mj9t4jgosnaJ+C9hd5ggz
	97P+ki8r16zVKs0Z8Pf8uTiLQPzNidi1s37I9hofw7cJSoX3yV8ZBcvlSP6oE6mnB7JdDioBP
X-Gm-Gg: AYBFou0VFMBdNletfp1bjDp1+3iI8lJgq79vvUxRdsXw2vIvyluiRh5z/h/WD3YQBbK
	W4IhOXkRHuwjDUCyM999iEhOP8cn6o0IF3HkK/GPZ0Z/MX6/yvPBAGmtqz1qWWvO/p6trKYKdbA
	KiSAy46F1QJImDjitkLHcKnwNb9RUwIkSjLp3SE8RFYw3OQwbqX3r0y23yP1gtAw1R3YWFGdqyY
	qUogMmMBUL2SYX8nGA/gJmY2jyDGTrlfDXk9yO2Z1qkdm2HP7sudK64IX/9VjdsVTIzifajEEZn
	IiQcwJtTfqd9J19R3PdjBo18KTdCi4wFFYeZg3H+6J/xO5L0pgs5ik2JwC8z8kSIRdD01SIcYlb
	vfrAMyXLNAVL/0PiO5KxyXvIj/lR6cY8NkOshSzc+tYoyAaNernRpn8u+DPW9jC9yAfyt7Dg=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840683e0c.1.1793193082899;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840624e0c.1.1793193082038;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7ac041sm596435066b.82.2026.10.28.06.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:11:21 -0700 (PDT)
Message-ID: <cebc3404-1f9b-49d8-b459-0e31d648d989@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:11:19 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXzrdufzphIaHQ
 ybUt69pOmS0YiPYdJs2hO45Htx4r6eg3/HFfA3zY+pAFSgdo8+P93Mv8IqMkoJ/jglg/+o4tS5L
 xOeEYOG/VuISVwvRL3t1QhOoAQZg8BJTIteyAMTUfbPSWYm6qKiLxx0AKj1bn6A+yqDiR54BnXU
 o8DleQNVGs4ASVSRXylxovOtL1Dv+W9tjXSVzmAHX8R68qHqSegigjJNM/qxcqFHwcPodMyg4Jb
 01b7wRxghnA4BV2ZHylCVQFLrM/GNNyOMfyJ3gK99hVRrMI5ysSicNMCYpd6hY0Ta3gn1M2qOS9
 Smj7+ItuKVjkNdGcQGuOgrq7QRFZBmjFDuvFj23IRHeelH4tcKVut8uWQaJ76JXvryNJVy4Vttp
 eNZs1G7ZNJQxd0lHyq8ok6BXpzmTYYAMioc5oRw6v5OX30QpFWz/qg45xH188eBog/04BMp0zLX
 Ayvj9vt3baEzghldXyg==
X-Proofpoint-ORIG-GUID: XtzUL1ie0D915frqcI_KNo42UuEjc9eo
X-Proofpoint-GUID: XtzUL1ie0D915frqcI_KNo42UuEjc9eo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX7xWnQuwaNAOG
 YiPLXepCvoNYeyAGkhTXL3mEQBziwKyjo/4m8AQeVoCrOVzaxRPr2dKdA7yIwm1VpdobQd4xJyQ
 AUpW+PSGoQTN+VeZNpLkycYBDM9Es3o=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f47b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lYDSAuwiKccqTb-b3IIA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 1:01 PM, Anup Vishwakarma wrote:
> The proxy supply tables of msm8974, msm8226 and msm8926 list two
> regulators (pll and mx), but proxy_regs[] has room for one. The second
> entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].
> 
> On msm8974 with a device tree that has no cx power domain, the
> fallback table then overwrites that entry with cx, so mx is never
> enabled and cx is enabled twice.
> 
> Make proxy_regs[] large enough for the largest proxy supply table.
> 
> Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
