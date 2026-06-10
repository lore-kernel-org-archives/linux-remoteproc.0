Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E219AD5C
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100928; cv=none; b=UhMdGBpPGD45yEfZ35y788e4Aa6gthzLZoNxN8XnFSUSrLB96eXoRndApjCbZDrSaIljExIXikJ3lYWjdQlytfbNO6HdapY5ri0NiQtT93Qge6ZEhEjV/n2OWbD6fm8J1eJZjvJYiH9vzdAoEvZQYq31EaaA0/EFrfAHaX53Sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100928; c=relaxed/simple;
	bh=MFXOZCdPBc0TVsd4Y2UVkvn+uoJb2263Pchu6fl3G0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqDBEU2AXMHi0C8pQ1SaR92vrX8+5t4oCQTGqU2jod0wBB2D7xdWFuupCYhYrne7tUPCEw6+DwQzTmD7ss2Mm/JiSwft1LUCyB/Cd8/1KCUL6IbV2DM/0MqofD+f3Q9pSOL1ANK08EDRdJor7ELspYJHFm2jiaQdcsMJhOQrNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6qg9sbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FT2hiE7I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6qg9sbM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FT2hiE7I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCIIh1512083
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 14:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=; b=a6qg9sbM49qI90pw
	IajAfxYbrHXzoHWl05FBcfEy0O9Fj/r8+2r7WxjlzP7v6A8EVsmAy2oMZ5pUuSf+
	p4OFEywRpVdVGc3oE7w0Wl4IEzl5ys5cSJtsm6Vo7rL/t2tNc8pPQj4c5VQEEqnk
	7YU7pSOLi7y4fxGC0Hyb5MkWIzktHIl8MQWJMmAedKs5xRVDuoXaLLx5ptRpregt
	nZLGKzwQabtpKgusyZD16C53Azom27trOWeETj+zoOVTkYL6jY4iUX7wmAL3S5NI
	Efbvq301aWIo67blgCfb0NXVAFgUEPeQS/WBWXFylwhZgGAdaOXgVe+CnDUeIJ8A
	ok78wA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeud2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 14:15:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d24c3886so5601587241.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100926; x=1781705726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=FT2hiE7IHhLq74SM4xmI6jQGSWHAphb3tueGkwRXNEDYmVB6MiBQVWcQWYivuDD8GZ
         bk4pyimS135eTAvjvkmpJGz4hHt/WA8ZwKQ4cNJGk3OxjLmZxnoysdrY9RC4bl3bf8Sc
         ZNGEqfAcK+hEpnlxrkwZGMcXPhhnyZXF4r5X5Dbzfq1CS6eXapqehAg6YvgMrHmz34uN
         3NvzPb4xkVwNOh1wSSngKxOZBfQ7YxJMi5RfLRDZYOabaX0Vq/4G3RHyBksS/wYPnxxR
         LtDw9Sq5W5U4Uit/7CbGcLVt7HxFLz5xyEOP/DjFWNtuU543MdTdh2WXoAItd7s7kzTO
         NTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100926; x=1781705726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=BIfsRCCmdYbh6SIEWk8WRiPQUQYNjnhohJzyy+tLqxKMP/5xSjf/Dj82H2qxi5ZflJ
         Lx9NWFqgyl0gB0Dh3Le744lJA7w4hnRaNg56hYb1BpFBe0Vfnw0v3OY0g31VHgaH+mg+
         JTInPqvhCneEyhchDgSI1xVfsV/uU3d5TNakeY85ThUhWLpWjuvxHvcxNDOulfNPMYOn
         Gn4x+ArQMV7xQtYrr2qEmmr5iNp7SWnD2eolbhC9LgFm3On3WhCpGTOO484MabbJplC8
         XmI53ZLWCSQXTgAH3c01bRHkDAqVT3wW31iqG+uYMfpI2YN+RxJxtuGH1kCYXxzIMpTa
         mYdw==
X-Forwarded-Encrypted: i=1; AFNElJ9WR8pHoS8orzbiYKGd1yGiEs33fC7wjZXOz0O4ujINmnU2xtGmLDOic1dHux4vNtBY9z4Bi+1hnRzKk3QD4IIx@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgHUf+wWhD6AFK5CBknZYMek8Fa5i7Qt7XT5k2ZBxX5jJ9UUG
	X/HGKEaebuwh1pNdzGAEfYUQBVlid01/GLKChlV1+Ub6VyUHYxl3EByf0k9R5FpFaENsakhhdeH
	MVtOL68X3bpWCTWpQqy3sJ0TbAD3M6ZEcoQagRnxp1bZ6Aro6HNLsdVQNJUNi/oCkJH6IfDNd
X-Gm-Gg: Acq92OGcQQFlKxPcgF8Zdqmhsaq6jPyiktRYOfoveKRcivFkB2mty8BoSfgcnB94q6s
	XsxLa8Tt3sfAJR3nobnBXusU+uFooFbd8ys8HTA2+GGQGeQGMyDZb6SbTcpQ9kwzgxnuUCkwRgK
	//KfchoRDpDqaO08Zq84vQjLt2w6tlsU8PiSXwQXhejK+kTPaE8JC7new3r7Ty5h13AZzr4cSoo
	2NOjyvu8XRuUKEwb62sDtP5J1UveEN2SkLprXkXQLy/tyvW4ehL58oHE5tS3stueSzheq3bqm/a
	6NfWD7pEKPCs9nIRifiqZhtYTSXR0MC7YywuLTlk2tp2euvxIQeBL2t0qFoxXq4c7riSrqYefpR
	xZS2cIXOR43Rl/C9rnDlZP7PtGjIIF9yyHc6K2VD0e6AsGpdkzjALvnXP250owmupwGiGL49N1a
	DYaR+Kagjg58JorPS8RZU=
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357921137.2.1781100925760;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357838137.2.1781100925377;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7f50:81e3:bfef:b418? ([2a05:6e02:1041:c10:7f50:81e3:bfef:b418])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm67240484f8f.8.2026.06.10.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:15:24 -0700 (PDT)
Message-ID: <5105b5d0-16d2-44d7-9c9b-b6e982d7d53c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
 <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNSBTYWx0ZWRfX7RQ1mZ59PN8J
 NbNgLm+qM0+RKvuiOVeAEhyqTtWHvpfOtp4rIXFYyOpWAZNJ06CKIe6z6RG0UsO4FJTtjXA8dXi
 8TrM8tqtm2uGc2qGVe8ECWcgkBE4NMNW2yyrJK2VipVK7azOtp53X4HjnIriB/+KVhsvxjaRNl+
 eW2n3VidBLJHRQQbv2aSATJ9gu+IERL2l9mUawYMhUgOgQ00DsX8nEsiomKN53cDW79uFxHS28S
 TqZJLI7L3Z7zQYAeBivcl4AcCiDqxh3hAiOV6mXAqWIQXZGwkNYuIYoA2unVcON9eSAYHUeaWTV
 5Y+DvOJStVZjjs4ZJuHeXMjsaAovKgDvXWhY3yXw9Dr4KQ1LBLIc2W+FbVkpRRkL/j+pcpy8O5C
 wytpL5vmVz1eINFe8cf1BJ3IsRQ6HtmaZ4zaeJvNuIGTii7qgQVaSm3ak75EIjhfKUulG1a71Ps
 iC5ng0HLVXQqwl+7yxQ==
X-Proofpoint-ORIG-GUID: iT-8tCDndRi5ApG4cVlv1YnajJxoLzBt
X-Proofpoint-GUID: iT-8tCDndRi5ApG4cVlv1YnajJxoLzBt
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29717e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=duYTza_KgoU2j0Zg4FYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100135

On 6/10/26 15:42, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
>> On 6/9/26 13:30, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>
>>>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>>>> cooling devices backed by remote subsystems.
>>>>
>>>> On several Qualcomm platforms, remote processors (for example modem and
>>>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>>>> Client drivers need a way to discover that service, map DT thermal
>>>> mitigation endpoints to cooling devices, and forward cooling state
>>>> updates to the remote subsystem.
>>>>
>>>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>
>>> Wrong SoB chain.
>>
>> I think Gaurav wanted to reflect the changes did a back and forth between
>> us, so I ended up in the delivery path somehow. I guess adding
>> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
>> actually most of the work. So I'm fine if we remove my SoB to fix the chain
> 
> Anyway, Gaurav's SoB should be the last one (and it should be preceeded
> by the CdB tag)

Ah yes, right :)
