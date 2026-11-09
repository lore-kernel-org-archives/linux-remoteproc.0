Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230727;
	b=neg8H1TuQkV2TzyBlPrG0vbJUvWMcVJBJm5FmH7kTaywWaBdBmvZydLVDjqzsdTPE4DV
	 5porjAZmSgCub86KhIliI0ifbPMHy2D4pmaeHPNb53Yq6Y3xtY496kAPe0zOXusXeXsVQ
	 dF8Y1XIk++se1b9Lc5G6u0+dhnesccg2sVKYjDtYKy+eaEhpAy13tsi3L3IG51ELvvO2d
	 kWDKLfIPD+3yqAbbfDmhGl7BbLMnP8qhtsLwYwPSCCK0ZoHogTTw64OAJDuFdI1IMReS0
	 /Dq6qxZYHPVFbIqMeWAdl7JK396bGApOogB/L2DaPBipAtjGappSVMS9PgkoSRRPMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
	b=YJC3XY/TTLZuxOI8zpF7L0XjArwAb8BcHl6cxsUcsYVDa7ho209hSxnfAtRv3fR6CdUq
	 a7i6mMKN3dNDFBT4QekAvewukYBji1UaTkDyD19pfPAPZxanxdfabHK2SsVQ/QbNaM6pV
	 uof7q/vDf8yIRcHfyr9Ehuq0xdw0/3YTm2Ul8twXvHjQpmXIxmsPKV/thfftz5RBsYX0m
	 dAEOQhhFaZKJIiFjKS1U/D3p125Ax8ksXJ8nkuza3g7kstzerZdK688DJknFFbkxO2KzV
	 6j6ah9aRAeyQa612Z0ituDoQjFvgkVLbJtQcNrNhph/7pfv/zCOSYgdkwmoJVwBn0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E1606A325
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 13:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831E1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3FR334839
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Nov 2026 13:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=; b=A2N2BIXoUnriedoY
	nvImvyBq6MLBI3geSgtYxH5RZKhfcMaG0vsTBKMAy16jprOQcUPaRFVHv9Q+Bc7c
	9RVbhiugOesjDfoOk0DKijIzl27O6d3sQEDo0YagaYLj2IXdsZfiSgCqeK9hd3x6
	SH4yPrjvn+7epiaqm74ZYyu55J5vxnFaxw2Q8HEEefIMmq7kR1Igs45s2cuzhOjJ
	jTB2z9R15BPpausQeZXVq2FvIrAcer8xjs6hPVDzGlmkmXW+g9MKSM2MTCKHQi2z
	8PU5bi4SwFeQeb0J1wmrK5f2JUO5PvM2Rv3XdxZJE4n9aRk5AsITXIdJ+Zk9TNb6
	dijq3w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58bu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 13:25:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecba171914so32304e0c.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230725; x=1794835525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=BgRV4ATiSKwfrl7cGC+bmNesECcZh+iXYgoqzkzyhDQ4xZa6ViwF1ZfFzDZEhkWjzw
         kbn82FFDEMFtMoNt9PWwNi0Th+IQ4y4oHVBhjOiVrcIrKPibVmOWycl/724LibchJUM4
         9bDKXwlcXNgfz/bL98Fh+KnUC/1EUYJB01ZzyDVsTZkgdYS10AqOFUtDqYmiLpTqkoqu
         nYAmcAK5AHG7D5RjNvzETOwFHKo5hp7T7pnl4b2l4ViWX9X/V4hCSvyDiMlo/FYSj7/Q
         3YwLcXO4h2P1kXsjHbvX4XV4T3qij0doz9jpUvVVpU+k8uSvPgwBFU9tJBMHjS8RO8hf
         BJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230725; x=1794835525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=MuO0uBpDtCO39u+8adV9TVgmnRnmpMuhXaiZxPtcVa3pxRx5UW3kSvmz/KYImsmbEB
         P08pJuJSr9t6ay/iS3MSq9Oj300qAtKRLu+nMmAcPWudn20uP6HGhPDhe8xA3BmxWmj0
         yC/XxElMmwOzhGeE8MSXZ/b7MQjWB1712fp91ZbO01GBPww5Ax8QWUZsyCKCNgYeY2A9
         3gNOiBkeq8NCpkuKTrUsYesYaCBgTFgnQGJFmI/qEdr6fEpsqAY1xZkjU1fd6aHhy3Wq
         HkFrg/DXCn8J5vMipqaSqGudYpNyS5SjQQo54fQwhkKiIWup+baY5rLsIvONVqbl07Jy
         FFUw==
X-Forwarded-Encrypted: i=1; AL+hErH6sVlC1HnATOcvtWD5cBLHkqvOVCKwYDo1mH8fe5o3XCllonkmIBE/ZRYZsD77nXFcNE+sYIFoudnlAA+1zKsp@vger.kernel.org
X-Gm-Message-State: APuU4Z912/RmISP6yckLB8lJmGt0JxulLj4cUl5rviWRW3wmb2wpCpNt
	Be8JSbgVJZUfPySMYTmlGwfNLnqU1VywdL5vUBwiQFe+aNS5kI9lShWIEvS11u3BiNu+mkjb42P
	yM3O1hQBtTJkD31dw82WVhtNWJpI4VHmQ/Vm4OaGEE0GRSNS2XEU66+UWbNsXNIKd5euI7i8BWA
	+VYrF/
X-Gm-Gg: AYBFou1XliTdPeFm5AbycjwP2nSYME3kQTZvXq9yEq2DTb8tuXkDyKzJOcJDEs6Zwsn
	4fi44+oqKOfZiRmp2PFe0lzYq3k6cKaB+zBY2YOmoxGtZG8X/z72NKOThYhhA9dOwjlSyQm0Iib
	w/d/PBPiRqaHvzBlwEzpbDGOEf63v9WQxyXtSsfMWdGUUgIJcTmgVgfoZXhSR6Q1fGK5gFmhiuz
	y9cIjBq0d8XLsNu8EekM955jlLDJPJQ8/CA3DgfMQzCMSFlsP1xc0QqLHEg9IeNBqz7dOoZ6p6g
	U8S4C/DC37+pH+wGfIR00GUWgXirh7UN1tu4HmAHQ/YOhMyreNMtMx9wr+u1FV12hFaUji3ocWC
	2vKBgmgqhx1RrzPZM5oaWx/3OxUeUwNl9Wdg8YEU/5qDRP3/eE5fZNZJkXF3XToC7vxuMeg==
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035252e0c.2.1794230724692;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035243e0c.2.1794230724265;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm172676066b.55.2026.11.09.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:25:22 -0800 (PST)
Message-ID: <f9f06d7c-2484-4349-aff1-239cbe1a99c9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:25:20 +0100
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
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ihYwI3dTIBJmL4z_21SBs-GSjkhMZgc5
X-Proofpoint-GUID: ihYwI3dTIBJmL4z_21SBs-GSjkhMZgc5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX4ZWbymnmTI1d
 HTK5gbWrKPc+JYLnDziY0Iw+cqvy2CH8j+E7OcNCWi6TRtjDKGoksNqpmvK0Xk2jiNL757GzoW1
 cmt1YgrlC3ZjkWRJdkKMKpvpEaNn13I=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1c9c5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eTyHnkIEs6k_cr9LAPsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX3k8FCQOfOO/e
 N4PViozrR5Eq/166TBOr6rNCvk15wA1S+mk9GWUXaGwNPrPsiuSRcEtPkcZ5DtFz2MDdLViBKzb
 FXmoataHrzsFXra7vxsLf+KmqoMx/o1T4SciW7UfTKWgxxbO7AtTl8r7f2Bpv3Xufl3NFZ26eY3
 KTUdz1U2llbciroZhnjdSOn16vDX094/d6H0NGp1m2Tkk7lJ5KYkzTaXEIRZBV1c8qb6ViMhHsl
 MiTgERuSwLc41xy08LhjEYd2ELB6ZePwCSFc5HOumqvqnV78KEVm2pgvyh9FZOL25FqK+VUHzZx
 AO5XzFSWHVrXOUYvVLuy3OfWjOzsaQ2vOQJeDBMAZsO8d3r9dTyp7Rmrc1wDIr90E0vJvFLQZx1
 U/5MGZwNYF7YiK8iXqW6rTOu2LV6WzcNEZVM1r3B/ZIVMWxSmJ/87jlxEw8QJwCwHK1OTliPbFD
 HqEiU1HPY5PUU1jZy1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +			sound-name-prefix = "Analog";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Nit: only in case you resend for something else, please add a \n
before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
