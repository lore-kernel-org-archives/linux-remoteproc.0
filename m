Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630496;
	b=5EYWEYmp9SRlLK1aoOazGl7AYY1OPDVMq96tErpEsRqL84Ja9LYmf1Lkldp592/bKEko
	 rDEtFGV49EGMkJODgM3duLa/v6bPKdCfjMbYdlwQjc1FwkiddrWRNii6bdAMU1JKS5MMJ
	 Lzb0Q8Ga01v62KNWKCUHOR9nBuuVhvKiUz9BUlG8Rq7gUGljrTpge6F8VOODTC0AzFjgj
	 9Sv6FMijyCrbq4SPLJgC5YMjfbAZasZMcb0zlAuolqvXvl4cDnB0YsXCONo/1u0U0EW5d
	 mYtSwm8Ck0Yu/O10w7/2bQltZo9t+L96BaJ3ffLu7jPtUozrosrGZ3LT7dokvxzASJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
	b=lvIMUHhTXNkRAYktvnCR8/Hb82KwQeeIyyJDnJmHP6AVZcOWSf6vlImBNgzXksfoiTt2
	 WEz5n0W0deVbwnm/6OdzEqvlcIqOIBFzy0coRsdR6Ak69MJf1rXDmEZh8OWIRiA4CjYgj
	 oHayZZR80I827S+xtoDNWAWLGg+EHaRMUs3LJRE+YUdWLOy6jrEamQdFodhptIEWM3LrM
	 hVtMe5qYU91Ydl7x/vyDmqyXzqjMsPB1yx5S3yjRqc4GJgRURQFYparKB2JiIkAOrGrVR
	 Wwta27rM9AD6ixJUU+vm3uRM2zJvLRRarjBVycaVhNELBkgXYQXRzNWR97QaptePnjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34CE606A337
	for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2026 04:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34CE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE3k3RP2435970
	for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mfnzKhlFqbPe9BxFyLjXeFlU
	GqJhtzF1P/zaxEKCg38=; b=DGlHfkyAVjbLeQibv0xJu7sEyaiPh3sU5qCTX3DP
	4dSkAuzvkY5vbmx7Q9flmQ1l/n8FC3kReG4T2d95PmkSgm9QgWb5yjBBIpUH07Ds
	8WPGozSvsqnFyd7dmZSDKXYFQymbCjb9cCHidPa53QSu8iXqVHTWsRWE1AjKl8BG
	jBDyQBGyz+mq5w4V6gRMuYRTutekiDyjdZIbpukxOBSB5s61zeQD+CKN7FrrUf2/
	CYMnpSr2qHvIt6e6xSOyS39Hin36rXJZf4xmzImUH9xDNe9PtBzJKn9bCli6CMs9
	ldJPDBPfF/cfs3Sc9It7mlO6cWQer1PpMwePs2SfN0hRfw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxg16g2k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37628596fc9so3770445eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630493; x=1795235293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=G4X3XvfSjX+7NHFr5Bs8PKMzeDvhvutxt5HkckXBucinSbIEPAG1k7KeE8QCWKGDe0
         lRgrmkGZd0MyMDzhSs/st8tEmmkd1H/cjrKV77BrvpJ1A8ASlKH7SQT9psLXEmigP228
         Yl5De1HvnHeYRJqfkWkVbAW5/OzTPrglN2VW9uPyywE45Tp+yvB2YSyrXjXkJiWy/l5H
         +Y+QACuZX4LT7YJMP87rOsskQ6qAyEIJRUcP4S9Yf1e7XXsJoyDFMFAyCob3fZklajLf
         j6xyb+yXpFOXOLnQfYFkTOVNIAMh2uYjbLgO+9AZldlWyReSWnAxdV2RGROCqbptTBsB
         pKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630493; x=1795235293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=wK1Fco5GRsNG+Wkbvt6kQEEBQkumGs1ybtM4dfNFWTtfbd1/ZYriTnKfDKO3D6Bs1N
         e0cHpjggdK5pZ1utvbkEbpc8hUXnt5N/j2O2gUSr1zCptvkk0ANU1YDRTn4dDEdQeNpm
         jOgGNYIBhqJdBEFCA3RuHg+uUdCVPXYgKxa055POPPvZXbov0dpIkLhzxZx9+1sQ9aoU
         ta2Gb5o7qKAAHai39k3eb1D34F389itMqBODdhAFwIHTohmsTx4LZ8vhj7DHR8Ep7Mb+
         9Ag4eyl208XHTyIxQ71mjNdKmTenCQG2YBYkAK8oqDPkEGNT/yNTRYeVOfNkCpmwlEQg
         e8ow==
X-Forwarded-Encrypted: i=1; AL+hErE0g3i3WVZP69bCrLVbuZ+Rn4BiGTFqX4lv1gB9gjDq9XCmGGjCf5ojlRpgVpYfR4WpDxm57d2mcLzjincLzjXC@vger.kernel.org
X-Gm-Message-State: APuU4Z9txeDKbyEVS5u9mSwaRmHsiQX/Nkbb09ogKSn+md83Xi9BqzS1
	UfCAPd9U5Fa+5tB7bFi97balKj90ietEMA5h0ufrdllFoY1OuRXypFl6ruKxXK3nTnybGkBO3AV
	E2Disp5ijAV1el9esgppj1Ck7cj0n3XUC5hb6Z6G5PzMk7g1hWOAKFOuzr2v9wK/RoYPWqoK7
X-Gm-Gg: AYBFou0/BwGF0t8vY4xrn3UemCcvTaoj498FmO0xsZiGsiAIvAlNrJkDkeTLdtfNUzv
	IiFO7byRBjbL6C0TjNp1MGmlB+3tHcnIXq7frMVdujM3uMXiuHiklsdRo1qI8IF9VHb7IHnyNmK
	j3uBV+TSaZlIcK4GFjXspjfMp7CK4NSlmTfjCehn7JQ9FGf//6QIBCGOEpOeWXhrl/0dTQZ7meu
	U+Ovr+QsMKr/9DK2hDHIlcXCH6YINoiL0OdZhjV+uNknGwio6OWtENJOj+RAEo0l7xFKh0PLrAM
	RA8hR3pFD6g9u8K7+QYw2TXNP6Wp7Y9OlJmw0S3dOtHDFI/39sm7FNMt5tmETAye6k5pcqKWu4j
	lcbZll42BEfa+cZpeh+yY8ZgqjT6VpppFWMKKzNDdCxPcSLE/iYqkD/Vw9tM+MowWc2kztA+9lh
	ap3jI/adrkhq2X3JU=
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499143eec.23.1794630493360;
        Fri, 13 Nov 2026 20:28:13 -0800 (PST)
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499115eec.23.1794630492711;
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm20332733eec.25.2026.11.13.20.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Date: Sat, 14 Nov 2026 12:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
Message-ID: <avfjVqCHXABFg4ue@QCOM-aGQu4IUr3Y>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
 <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Proofpoint-GUID: Jr5cs2OI2sumSyVW5PIU32hCvS-P15rl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX4ALXkz4UqIWH
 lpxbl1RUPJb45yVpU8b24pC+ZpNe+FPmIbN3BjkFN23fcr4fB/vEqo4m/+VkwvF7UDFd4uKdVAM
 cZTvvz8HmIhxB37DKT/vfExrStb9Nag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfXwmkEfnhYTvnB
 vs+UDbHHqYawvJDV1lG6FwRj2V+Ytm6OY4oBXHrQpDUVowt56JWxGvBfoG2OiYhAnpwP+fBkGLg
 c4tchYu0fVbrjC/vsFPBRQlUpzEcHgBsT7CZxT8P04nLZYEHlGymv00GhmAeusBYgHg76ke/WxA
 N3ELXDG3kFyDmyAdZ9FLVpSwabqP98yFG07Zt0zeZG7zLnTGFJw7maVDsu3L3IJ8abronGK4jjf
 W5hvjPI9DEwU58ctzOqN3X7ccdHKsJ5MmdQLOSrdi3WHbYXAb4tztp3KnRGBRVH4nk04b9z7b6Y
 c8g+ZrRp3d4W4xm2YIMa0zus27MXeTTIR/WBcdxbELPxDsFpGKrQmCRlrzG/5wX+QHI2CM/NVBb
 C1NpOBGZHXDped513w9JwWyHqsp1OYOMTgcRE7II4l+K7vtOqt9YRl9KeQL3PKfKXydSVwXhcK2
 AA8MJ37P82OQuEkzrOQ==
X-Authority-Analysis: v=2.4 cv=QvHLTlyd c=1 sm=1 tr=0 ts=6af7e35e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d2ahPazU6wztV3fc8WMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Jr5cs2OI2sumSyVW5PIU32hCvS-P15rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

On Fri, Nov 13, 2026 at 05:54:13PM +0530, Anurag Pateriya wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> SOCCP is a RISC-V core whose instruction fetches go through the
> SMMU in privilege mode
> 
> The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
> in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
> mapping to allow it to fetch instructions.

This says what fails and what makes it go away, but not why. A reader
can't tell from this why an RW mapping is fine for a data access but
faults on an instruction fetch, or why IOMMU_PRIV fixes it.

As I understand it, the chain is:

- Without IOMMU_PRIV, io-pgtable-arm sets AP[1] in the stage-1 PTE,
  so the carveout ends up AP[2:1] = 0b01, i.e. writable at the
  unprivileged level.

- In the VMSAv8-64 stage-1 permission model, memory writable at the
  unprivileged level is implicitly privileged-execute-never,
  regardless of PXN.

- SoCCP fetches arrive as privileged instruction transactions, so
  the first fetch takes a stage-1 permission fault (FSR.PF,
  FSYNR0.IND=1).

- IOMMU_PRIV clears AP[1] (AP[2:1] = 0b00, privileged RW only),
  which removes the implicit PXN.

Something along these lines:

  On Nord, when Linux runs at EL2 it owns the SoCCP stream and the
  remoteproc core maps the firmware carveout through a stage-1 SMMU
  context bank. qcom_pas_map_carveout() uses IOMMU_READ | IOMMU_WRITE
  without IOMMU_PRIV, so io-pgtable-arm builds stage-1 PTEs with
  AP[2:1] = 0b01: read/write at both privileged and unprivileged
  level.

  SoCCP is a RISC-V core whose instruction fetches reach the SMMU as
  privileged transactions. In the VMSAv8-64 stage-1 permission model,
  memory that is writable at the unprivileged level is implicitly
  privileged-execute-never, regardless of the PXN bit in the PTE. The
  first SoCCP instruction fetch after PAS authentication therefore
  takes a stage-1 permission fault (FSR.PF, FSYNR0.IND=1).

  Map the SoCCP carveout with IOMMU_PRIV, so the stage-1 PTEs are
  privileged read/write only (AP[2:1] = 0b00). This removes the
  implicit privileged-execute-never and lets SoCCP fetch from the
  carveout.

  Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
  instruction fetches do not go through the SMMU in privileged mode.

Another nit: please use SoCCP (instead of SOCCP) everywhere, e.g. patch
subject, for sake of consistency.

Shawn
