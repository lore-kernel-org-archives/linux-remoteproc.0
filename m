Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795406;
	b=lpvLppXrIi5ngEAyuabN2H99lKRHsnZb4Ix89tYVssM6j9S/ShMn7v5q6Ao3bpzqSe20
	 f4KqiLtdycIHKNKWX0qjDuMazPmoQW58U2tUGo8l+7hOWaE+8hlLRZZj+KRBe5Lzgh86k
	 GYh3fUhmiTw5vrFXVYNDj3yClOYyLmFndl8VVzi3o3M2hGRXIliSzJBXSK4YLvtma5KML
	 k7ZlCn9DMW1wqP+oM24sFIi/HNWHf0DqZglL6rCZwewWPqqx7f9GfmczQWxyTC1SO8DLe
	 nTgUvbo9hzgD5Xfp/IwfplRRbXcIbyOzCZCjxC0TwqeCUVcN4JfRDuqu2ShFotOpagg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=syiGW/Wr9NTtyYtTyAH0/gPlFp3Y1XhVQDuu6GKSClXIFjcIyW/gz5y/bY9sbRfeJt0s
	 RUvk1orap0zpFEZ+0oeujo+iDWR2QfaR8uP/O+niYIisDTLYuuRhKTKXstq+DDhkXwKA5
	 l+SfzVDVUqk5SAH1LRGTx2QtAac6c9GOJ5tRJrwDJayEP+CEFsgGIUPaRa+JixC2LIMiT
	 nZtyLTO0TTOmfpmtGQHFKp3TarqCVpbNkSwu5LPJchSpBOm1ZialDEzag2J3YEL5GkbH7
	 sOI/H2vEV5KMZ91//R9wAsrV/XX/NJlQQ9ZwT8eBCg1TcRfpmQLMbuhKi7CGcQVollg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/gvVvAi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C5606A32C
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 12:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/gvVvAi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaFF82729016
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 12:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=h/gvVvAi6eAZK15C
	MLNXzeqgMsnkuBrkhrUbffgcVRYn6KMDV61wc4WoLZ4MDmhEFmeI56Re3fM/2KCS
	a/+ywz3R/Svb6BxVl9E21ZTPBvyio77QMEABtmn7n6WruVf8gQQ8fWvDF5SX2tU+
	XJEXQ5JvixttG9bieUVHoGkiN+US/XQSFskO3vM3eSe5GhFlxZXwIUQDTtuWm4iX
	yK4ey3jfowr9yxNcl+EBGjftHiMX0fBmfhqxXuNcha8pMrVhnprahllUQNei/ato
	HlINbkSDh1LmqD+1+q6aC7T2t/Wu8F1Tz8bbcz/uWereBiREB6RIkYNUfwhlDqNh
	ZVMaog==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbbud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 12:30:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9833e1390beso15847241.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 04:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795404; x=1794400204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=AmLH9o7Dug/NxxS/wAXjHeyi7VXjb8eCXyCh47ad0QWVgwxC5WBzWLpUu32H+YqZLB
         vFYTG3sBWUxwkqsvrJbS6/rrJWXHk3T17RuGbcSsqwmaTi/wwDAxdCxExEjOIxT4m1uA
         EQaN1zpHNg3/AG8FzE92mb3IavgJgzp1gnIwaE3rIAcD8vDranIMh68CFq3NcCc8T1HJ
         HF4u4KKYgGvOWFNZFj6IqlKTWUafS6yTiWNPYq2C66r7//AHPPnzNOtXbja/E+1TqD7I
         YwiYcg28dHkZ3PI7Bi9B3fUMREROGU8Z6qSwWLGShk+76UmTgauhGJcDJueZC6f4PYUL
         um2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795404; x=1794400204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=y7jxZTxy0wmW+liKu+NmfVh0ZcbMvV4v2rQgaFJ09Bf+zwlzhJ55329NprcYgfP+rC
         3k6JDdf45oyNLaM5frT29Rt1Qdzvw5BOSIJ5Q82Hu7rhoQGmbuNBDvQFIIFJda/K30DZ
         Cpe7w1IRNmvO+9ePsLDijdsSBkqb5dzUTGftzCUC/+LSutxBP+zWwbD22Z04yQqn3v8H
         c01USViWrECYOz2imGQOEQiCKg5E74SWT2B6MpmbLzFRLv/4kPc1hQbzlLWSrWbapk+I
         2nfxB0n7D67QFUPMtlhGGkGXlvCHTojvuzh5xB0zjHBJAbeM4v3HqoUULUVrqFnJtziC
         aXjw==
X-Forwarded-Encrypted: i=1; AKwUvByGc4qNY7WDj6Uo2jhZV3nR9je4v+j3tcRCSsqXcNs10w1kMevzeXy3FQSI+br1UQy625QwZ+wvhAp3ChYxEiLx@vger.kernel.org
X-Gm-Message-State: APuU4Z95dIMP2ckXhpZpOOZ0/RSovfkkzNkcQkg2kjIOel1g5LafySxe
	+Dz7lDzFfBIbq4tRuNtz6ZbqsoA65CKtYNxQMLpfKqSos6+67UFK7GeLRR3oYyn4YmASTXin8i7
	IUljoIPr0UpoUreZZ3vldMoiX/qgXBoUWuJAD9LwGxTTN94vyK1FcHiw538WfU11H8q5kuMtN
X-Gm-Gg: AYBFou3DzZtnKLpvhHY2SO1d/d/D9/8uFWXAob/+ytoETJo7vHe54sIf+otUXF3uWLR
	vrShhsH+xMQPZ3ATyu9m1zV3UBX5mHNiAzoP4LRQy+gocvWaBBHzWCko3aKxREZQ9RCe6WeBPJ7
	utawrRfonlZGfeK5OqXfhwKIawxHv2lv5Dan2bcP1G7ivYzl8sOI/7Q/nH1ue1Le5/MAAc+wzWB
	v7J1gpPDK9ryfKna00q92NKGheCr1JZKknIwSXUvtMcIwzPc9kXVjfPX3neiM8pm/9JCOYxxOv2
	2IJa5Zrzq+uycsxw2vS8Zg7gzDSmiUj2i8D2y90ISaRGHiq5H1GIlwgWUShH69dASOn7G6Bpebq
	HDNShVyI8UlX+iYUCM0YUjodQXzIN7ga/PxFJR6gRHA0IeGPZ5ejqhCJvY5i85ZWNDxJC
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056995e0c.3.1793795403946;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056959e0c.3.1793795403413;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d3acsm62408966b.71.2026.11.04.04.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:02 -0800 (PST)
Message-ID: <cdbdf12e-3679-412c-9a66-f9497c5ce832@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: Convert subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb254d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Y8z2hI9jYsoAkz-9H_bEw_ziYiLC-RQS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX1wrapFgijR9e
 vtHKAha3/V2NEOxexoKqzKRrLG0WOa1tFf7k+4u/TkwGafuGriYFsP3/VF+7mi/jMeMXBfSVf7m
 u0PFk46yicUeeszC3msujF7SB0xQFyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX4LMDh6xqz+6r
 MIiE4BavMh8xMu0NtM03No7kTwc9qRVlp3NSZv4ZbISGk57Vfaj42yKW0oWh503zlMwRe692e5v
 tcfSp7LkaezpS/+Y5aBeHoNZ/FblPwsC4pAzN1SkgF0PXWHKQ2g8cVpAi4AtBP8LFXPmImeXv7K
 voq1BNjWS4k9HAgSjIcR0sty5za4b2qYCCUZACYYYLY/sgsEukWk4tX7xglXbqmykvkyXgPg2iY
 mLIxIFc7m1pWoJ4J2KQlPuRE6CArw+MAt7RjbabBMdnRbPCHrMJukXDIQDxnWv2yFzq7AQQarlo
 b2lC7TXQkuyUr8eMOJVw0VVI5Dnd1bi7YFj4ZO1pWBj/APbMB/rIXQHfTpJWugSxA+9oaT2j7fd
 2Lxdd7Tf66C1lMjt9nF54B//TLpqVzWWbnBGNfN6WL8yVirZghlguAf3GZkX9+HCKeHWiRo258o
 oNZZ3h4UeajlcoKbP8Q==
X-Proofpoint-GUID: Y8z2hI9jYsoAkz-9H_bEw_ziYiLC-RQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
