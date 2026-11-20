Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181198;
	b=rt2O/MVjYrlZt+JsSXty4XGkyzjU5b14uYt8IX0j6TOafc5V8QhTzMWpuQajSrcbDELx
	 45aTrZys/UPZcNR3DmjyLHu+XBwPK5op+1oBk52hIWGB14XNudeTxfgn5k+v4B9gMziW3
	 TukLj8wO12UKXAIieYLmko8EOPs7sGh/yUwxUvqgZpGmolsG/gzha8zUvJ0P+zruxbE+g
	 kDwbhfCoj+ALywTy0DyNH3k2Cg+SB+Q/p6RIBIBVy8SUx98hljyNRdkh1ZvDRnhI3g26M
	 s6gamtKGVU92vtm+ZrTU3q9MddoQUbCir7AHCtOQehhjYAleiVQEdslR+s9WtplDhvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
	b=3QE29tLpnXU73Th1syi3W1/E/9LKpWsxeGr4wfZfV5lHEmd6CS0QruLvLtLzZVjJdhmH
	 QX+X2RTum0/sAv3sZ4JZMP5ZHem9y2XwaS2Nx75zhcnnYDt3NYtMNSxVkEykduCT3WqM3
	 5Updk4eiyig6p9GW0ifEC6LIPr8voxCZR6nCtFmzFqLpN13hKIdtHj1tgFpFobI2bdpfh
	 W10NTLSh2zDj1e8l4kotjDpt3kfhAKNUxtqg8xH52vOEjEt7nb84JIZXOPUiN9gSmn6cw
	 k2/KaaKS5v5wPhV3yE+SOZGFp8d/dx+jU5+2MlG5FKwqiUHKorhgeEwUgLr44cWGt+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j1l/B9Uu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239EB606A332
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239EB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1l/B9Uu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoiZ1462866
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=; b=WW3IVOUgqZt2JDN6
	rcYX+9pgdjsLTzLooxM31+fC8UmexcaTte8Sab2dXShQeDo2AlpyRl9Nr3NN16iI
	9t+Hxm+0eCSO98atvXzK3nl9BHXmin1yny4yh4dYvQYzI4xkqogoa0US+sVhYCAc
	9RdJ+E82NtalK6RDuy20fsOsbmqeQ03JKs5te58PFqHyZeIPz8k3Q4v2tBQVIwiM
	C/THG8hXb+BRrzdxnEN7J0JPs6JFVqD/2hLNY1FC3nxY8QRmKwOQhdJZgPNfYrco
	CqZlnqiyiC0gpREHzfyEb5JBdYXefo0n2PopyQKo3ug5/VgMdvYJE+LAw3nqioeX
	woN9Sg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahpwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso1158294eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181196; x=1795785996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=j1l/B9UuDLjEc0Jg5PVUu60ymjGMJklgVwx8jxWUxRGGFwBkb5tid8QvkCmTurzJrn
         P/36Jd6NpME2g/pImTQdvpQhNN06iJPGc5tdytgBW24FdHfAPijtl6LJhj8/NPcnOSlT
         JjoEJAol6q5mU62g6fkTGrun9U+tZyx+3tx7UDlDy9JX/5lyAVsqJlwe3cd6/D+b7wF3
         JJTBUGWKQOwTpAa3ehYOV4cXwYUit/ju+ZiB1hx40D5YKnV2j0QOmZqY7RAlJnGgGTf5
         2U78M7qbEF3ixh29YZTchyFo3dOyVdQ5Wz5piDvrjxvHUFAvx8gdKEcy1G1TU0rRytHr
         7Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181196; x=1795785996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=xhj1xVAy090SQnczHpT5/E+TswXP+hM+RU8ttfZPjmDokhppKi7NgTyT85DvbO7OJN
         f9Sk8zUkFAncNVrdo6QFJl3uOAWlSwnu+iwDUyxlS8tpnWjs9SHRjsfirE3gjk2n6r5N
         s/6ziRI/sZ1wHQNsUBDEK8CglqxkkWX23+z5O5ZIun4ufw2CIQFWWhmpvIyIEEtjdLR6
         K5MNpmf3xybZQURXKu0gSIXjUHXSXKj6E9bR7bXCMk1LSbYk4RArcEiD+aIhlGJBILTH
         19d0QuaG0zV4QV/mHqp7LF9iGoDe+N4e0BaKkyel75L+RggS1ntzXdyB8l6KudaiW4En
         5Fzw==
X-Forwarded-Encrypted: i=1; AL+hErEQ1NZCkkE/gHNcZQHyO683HxC5lRkQFhbu2//EaUsseMB8A9cSUPZ2ljPzMgTeZaVvyJrgpB9gNTAHqNyKB8i4@vger.kernel.org
X-Gm-Message-State: APuU4Z9upxjZ+7Kf9IJJHIAJKfcSRhU0nO2g4ZKdQohpd3GRAPhIh9tu
	BAgSTlFg+vw6MSmVPtaHH1JkvtUDfsZ9YajfYzMCoWVcBETyBPwjrCOo5eh1u+JFRQdr8vltGOd
	ZKzK52z4JSSPWQR5m4UDE7d03LXLxGSPXQZKtv3JaqSrmGS/kz2rhqL1ALoM22VlSUjU1rvzD
X-Gm-Gg: AZFdTZe8qbNiwDLvyVxvawa6ycnEkCpNUDv+xoTvKYhzYBgLjEiImAXLNfJvj0VQwFB
	eDse0DwFM4Wls2JtPA1s4bw4KpIVypTLyvQqV+7Qku8UN/OSG/NBZ/XKpCv9uzURAAiJQtanTHM
	W+B36xAFjwy99Cz5my66n01zeTPqAPyFeOPTFfAh3cp2kPbLQzpodVVK5FCOHE+jNt/d10756Af
	mRlVCuOaGHLjYrweSphE/svPs7zQviKpRkKM0BTDXzjC8xKTqW2ZQNBPZqv+XIIqD3S9QG1aoO9
	3Pm3w5WSchYwkwn8HJLgS+qu1yE/hjntFkKxPwQDjquSF3V99zf1MLejCX5Ky7GHONLNwqtO5HH
	9gaBrNalmuJ9xF/DXBvVQDaj7z0dQFDDMx6L46m+yockrcdZc9VoqhX1su3yhMWJBRi7UJv3Gda
	Om
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679279eec.7.1795181196128;
        Fri, 20 Nov 2026 05:26:36 -0800 (PST)
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679232eec.7.1795181195409;
        Fri, 20 Nov 2026 05:26:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm9691731eec.26.2026.11.20.05.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:26:34 -0800 (PST)
Message-ID: <293200ef-a480-4732-82fa-e452bd5eb61c@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:56:26 +0530
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
Subject: Re: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXx/NFDS4UhBqm
 cQBK+Y7i9PbmZok4bYzEECJNQqF2Y/96J8pqba+nNmGj2qx5ebigou3E9MVpUmH/tYMd63yGhfb
 CoK6feqC4g06h5cS79kISIcWb/7cGSXNZfwi6yg+2DUCkRKysm4+aPyTxMU45YiRau/ab51xnWW
 CZgC+O4ohnPA0dx+WDTBZCvhL73nVe2pKuI8yRE46PbuMmn3sVt6AkVz4dys6AmcUAKozrXwHPD
 KAQPwomlRJpUOTlE0t6+phktp69tJ+Yp/o0n+kqQct1mtiPYDaZ282CpNgIhOffv7kY9gXhPKnm
 /PA7Itv8T720WJlt6CzszzAQqR4pPPWvMPq/jfbAbY6Sti2I9hdNJiJBGIi+nwrrscJLKWPKcRm
 8t38GO0l2E7OWv0EIl8gUkcEOUpeXkI9TnT2B53InR9ezThV4CGhU5fP/k+s/eYbZ+PUilil7pV
 OY0Z1jM6RkbQupyCCNg==
X-Proofpoint-ORIG-GUID: A2ntVPojFnqcucIFJIBMKVJJpfdJD6C3
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004a8d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcqzsH88EwdISXoLbJQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: A2ntVPojFnqcucIFJIBMKVJJpfdJD6C3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXxi5sy5wp1rXX
 FiBFwTHm49XtMh5Xl0KZ29CpVopWWBbuEAHSLIKfzFHklK8LTPn1R6NHRcjTFs+O0W1k8LimMob
 1vR1kuUyB41o86Z760WWOpRI4NYCnVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

On 11/20/2026 6:46 PM, Komal Bajaj wrote:
> Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
> default, with Linux running at EL1. Booting Linux directly at EL2
> requires the remote processor firmware IOMMU streams to be described
> in the DeviceTree used by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> generate -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular DTBs.
>
> Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
> Gunyah by default.
>
> The series also moves the Qualcomm PAS remoteproc iommus constraint to
> the SoC-specific bindings and relaxes the item limit to accommodate the
> remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.
>
> Komal Bajaj (5):
>    dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>    dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>    dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
>    arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
>    arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
>
>   .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
>   .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
>   .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
>   .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
>   .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
>   .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
>   .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
>   20 files changed, 220 insertions(+), 3 deletions(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Sent accidentally.
Please ignore this mail thread, refer to latest send [1].

[1] 
https://lore.kernel.org/all/20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com/

Thanks
Komal

