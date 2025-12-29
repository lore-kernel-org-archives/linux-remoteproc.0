Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3692C1589
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022722; cv=none; b=RX/dl02VJCZAPYImkxAUPN/NntrLNJd3eJ+OS2A/joB+ZNg6oylv67kEdRt7dFhELh+lfTuYbhVK4VM1ZsfVMEp0ekNTlo5oRzpYhi2Mx1AkOfIwdujg6pPLvTH80VARazy31QbMeD4nwqt91KUvKb/wC4gCYG4E8olEoRFe380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022722; c=relaxed/simple;
	bh=hhAsUdZ/3ACUABNSiakxuLJ6XCHkUJcEly56O8oH52k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aI5y129DucO9uMC3gS6MMWj4ER/jbvtfhXSwlg+Ev/sVBppAEa6X85hIuwtrgg1bWq9xKVi7JfU3p4KOtrUkDm7Y5YNroYjxIsF7mnDqQeewqc14ZjRfuMhtY2NFpFTQtRfKP6VS0eg7vQ7c7zX2Ntg+36Vw6EVN4vNvq+yEsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPZoWL8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvNTSr6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPZoWL8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvNTSr6w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA7X4r3402630
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=; b=cPZoWL8omhgtb7I6
	5F9xj5D4cz+WqJfpgYOC0oLN12qU54pm15uPwPXqlQ2BTcr6Rlo+D2tDNrerYpY2
	s4JY4lty0GxaldoqDeIUOePY+8V7DDwpJWIInZiichHT7JaKYIF7A4qG7uoQcdTy
	wvkzzsuA9YaLiEQsuNTz1lk9pQepvY+8wMX7amBE2uMuetbimVH8G6xGM3igH3TV
	WYz1IjSQH/XTLwRuEcZlnYqJ5kI0fMq5XUyFvUv+y2dun//LZeK0FyXAuSSRQH2u
	iCVSxhidrLLaRVm1Aw9YPsbUVkcaY2PuJWbh0l/VW1O5GQHENo1tvZpbd1pardjY
	3fgXzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnvx4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:38:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso23568541cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767022718; x=1767627518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=;
        b=MvNTSr6wShmq+wpXE2bhBRcMPmp1wkqFj67ifn9I9JLYZjM9pkeCbq8386e0IuK3X7
         WczuFVD1GNRXgFU3dlZUXaDGZ3Agb940OAn8mH7wKBd6zWJQfCBzG9Tpk101gxvQn32k
         tuhTBtrpO4FdOiqIiwKTgvpFi7hlF5bZvQUXW5JujSwpih5fSfz2ofOHccukLRs2c/X4
         CmnYWccGgrtJO0XREkul5JyYOqhWRCIZ3rBWpJcFmbJ9Zaj53dyBtCrAzPoaa1ovQ3Wx
         EbKvLRUse2S32ClYlfXzD1R4dBbP+FSrOu87R0PcW4r+91yaocpgh9S16a3w1frey/OQ
         SYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022718; x=1767627518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy3wHErMPd36fiuL0KsO80Ayi3dwwWvSwO2XvtIqviM=;
        b=JOP67LOz2nNBle2JU0+esuTAbw/YHuOYPqovG2LULFI2xQXOLLk06gHiu4W0wz/HtJ
         9LuxRfjCvpGKWLrCHttqpB5rVPvYi0eKoshytObo34/HNiwQxE/lXjfEvivFfvabVG2S
         TV3ptU0YKHGSkmgCxNyxNFM3zMV4h8mDwOakOp3RP2XlVU+oV+ZVkXsBVxYa5VQSscX4
         3GzerHOGBDN0Ze2wIby+9OHUFJD1eHkq56NPxDM2p6hUWUYYvJTP1MUnIPziyFgINqGq
         S8kgJ3RJ+TVjktkCW9jwrYXz7pwQK64IxNagkQTd6OV/HHCKiv9s/tDe//Jmfh+RfIDm
         L4fw==
X-Forwarded-Encrypted: i=1; AJvYcCUTlsORsFBRXCk0HmPxtEAbpkFuNx1EB6D0FewAGBJkZq0CVJ1Z6xaCEtKdEwnl+fyDkkdtYMXyK+sm4Dweh1L6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yR0fYA9OD2a21G59UBIT2pCDBLyJDKi0FG0cIhVF74tsP38K
	5a9zOkwW2l6PRiqII5f4z2EmflcHteb+xGsPTZ0vCx2q5IVT8Vzi5xLO25LgD2ZzHvRym0I3CIB
	dyb4Q+cgZFokV6ONax30gJxHspLIx+a2Hxpn8OW3AJsncg4Hj73xdSc1r+9V5llT3RgX7Mvmx
X-Gm-Gg: AY/fxX4JHansD3a7d0MRJ8GNGRkRzg6MKLxCZqTBOQ9HMZhmIWUR23MfWImmFCE32TF
	lc5xmF8BDco25VbykktTFq32cR08A8TgG49jpG4XT2tp1s8W9Rw9+VkB1DGWTmmSPdTXreUqhyJ
	QRGWi0bGLkXW4DtKr07Ith1omtcW0CEg7Ml97qDlU+t1jesXOEN7qX7bkqk/RyWUtycD2zmYREq
	PMenmuGzewHz8BuYyYWVkgfRa3Lm3d9JpSKkL1izygC3qjENjTSeM6LXvDSopLHLSIQfIT30JrL
	KNhqwtGka3VNa2/pEGM2b8Sd9ku+ZpG4z6avnNY49POXrwA3oxR9ellV+/5UeF4O2nBhS0tbZOZ
	49AOxZjt3EGLUvIk7qC/O4UIe8roJnRwk9D9yTTpQKZz9Fzxa4BWEmtpiLGHU+MHG5g==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr316313901cf.11.1767022717891;
        Mon, 29 Dec 2025 07:38:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESSBCC/bjtrBlY+h5w2iX8YZY039H99iVEdZQm7o0476WqOh3Y2NKmcnX6714mpSpe5csxPg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr316313661cf.11.1767022717486;
        Mon, 29 Dec 2025 07:38:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm32058715a12.29.2025.12.29.07.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 07:38:36 -0800 (PST)
Message-ID: <39fd6151-7b64-4e39-9b97-3376b6b62b61@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 16:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on
 qcom,sdm845-slpi-pas
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6952a07e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=y4MapCRUEyX4IQXlyOEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qz22LvvJyBRPFuwjNLRXQFWPIIZTpkmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE0MyBTYWx0ZWRfX4+w5PGJ2Rqwh
 C4dS0cAmqUTENPEWn3zlIepkHJYW4HW+E0ycOyayT3JTk8b93z0TV3cab2xu1NKjOORQGCVNVLD
 2GWMtynDuhQmBKqQMggLEoGUHG0szMIdHVlgwk+P6+bSPTf8mm121/KPokMxLncf5dt08Kccv45
 qiD1MbIiSOZ4hesTXfx2AAR+ijAWqCIbeGKkSnGI3Ftj0H/+LpsJJr3tFB7hkLRJ7FrRZEsg2H5
 G5lHYRYutx7fPU57T/qtgqIZn7X85nLy60KvvvBzzwhDyCJcsM17geY9FfXyswRqvTnfj5CNEf1
 XpN7bsteIoJeZzFeqbPZMKxGTr04COBnPhINL29qmOgbryEntG3AkIt+mgBJFFU8Eadx8KYyjUd
 DhoMCJPNAEaN7KsJUdqLTb9tM7lFLznmMtofUwtyKNQJsLfzN/7sBcUxSLd5VNZpqaFCZBbhXd4
 6pEdwUL0y1kJVncZuFA==
X-Proofpoint-ORIG-GUID: qz22LvvJyBRPFuwjNLRXQFWPIIZTpkmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_05,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290143

On 12/29/25 4:26 PM, Krzysztof Kozlowski wrote:
> One SDM845 board uses cx-supply, which is not allowed by the bindings,
> as reported by dtbs_check:
> 
>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
> 
> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
> cx-supply seems like a fake name for something else, e.g. some
> enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
> established ABI, therefore document it for this device only.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

fyi https://lore.kernel.org/linux-arm-msm/CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com/

but this one seems to be more tightened, that's preferred

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

