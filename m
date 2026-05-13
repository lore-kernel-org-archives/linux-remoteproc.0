Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51531B837
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696371; cv=none; b=Y0a4ysg3yzHLSwUAuOpaF1kxQkrcVIRv+zPczOOCsd8YnClanuB8W/znDLasXyuowyU4aFBquP153Dol2XfXEtiPgQL7Cb7G5dsY+SuKnlXfx7vETQLajRpvETIfzOmnFHGl4Kb058upEG4YyM5sNx8K9DDIivMBr0m08aXVIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696371; c=relaxed/simple;
	bh=OV4PfceyG19hBTR3s6fFftTS+Jdev4XVhsmwAWPNwj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=FPaT6naw4TXv/OZi1Y15gV2qUdn3rR2UHqtrBOiJQ8KgFSLeUH/NvJpfV6xMbGKP7oTb/EvwrXD8ism2/5G5iUtgasb/0tJJ4UGbqssEJbDSfQ64QlxXOxn5opr23pBLTHxCusBQnUwdBpeh32mpuOFXmB3d0ZCeYWh/zmsIEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7liTCF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8AjoiLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7liTCF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8AjoiLw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCc0dO2965290
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=; b=U7liTCF+jEkricGz
	tIQQDX5CwfAb0PWYCyQo9gN9nOGXa/OyPq88JGhzlPTxoE1z7OIzlKxn8EoudZu9
	LVfnTCZNIwAWyctJghdVxjPt4KYW1gqa7SE1MmB/JNbWeY6tM3m1vYBDj7P9mZSI
	33C9bH+zDaJKBZCgXCDRqVKdVqcKe9mF2meOdeV6raQE1vGgmNKFfAsUJal3bSH7
	6ql83UFwZW1DiigvE3JlZ+9Y4uoKFvbz5/saWUUhbsD1y65davuYpo4Vn2kTKf9k
	paqqODdiA5sMm5oDorqHQjS6oC7uXJOdy3JH8DaJihQIgA0+A4n7zuI3uk4uSLzo
	ptX/zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5arfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:19:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so8917090a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696367; x=1779301167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=;
        b=d8AjoiLwQGdmkNBLSgqGaNJYOF+ORmNJZnxhW533mBnYdYhI6HdmgYZxDDNQxnCKbQ
         vGiuQ3sFwZEDxqkjypKI8uX0nez0jvGhjKx5R8eHqOvomseiPNtFL4/baQbg6DofmETt
         jcsUii5gPb67EZgHE7hT34t4k57o67y/BhdLA4vLL6fTbXNsu02SrzQZp4lPv2HVoVKp
         X/qk1spmtrAO7RNBnDijcL4HGb6Zcc8VKZRRoMb8So09KjY2xtutjzlwAk6jFqB+H+fn
         Bm+vYloTbF8F0I/CklDfIjVIcOxvyhp6iFT+q0a6cBbrES8D+O+dfuGTnC/agRO7HIU8
         rLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696367; x=1779301167;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2wytpUijrKO0T5ubOcr0fnwpc//VPFoJ2V9cgdQyr0=;
        b=UDdtMWa1rz+V43xPoGBpP7VpsnUSes4nCykT3xHEx1MBcNuPwiNck7T9d56+E2CtJG
         E/1fzIF+hrQ2ms+zZcp1WG1cOqEfIYDgEfvS/gp6QPfd0wkWPNLSIpV5vAPqwd6dnv/j
         QPlLcfzCjzzdnOcaWwvCAspdJTWJtRVOo6bX5FxI+v3uCwRb+LwyH4o7HiBpIDfpu3Ey
         h2L1/vDrSmYrtMCl8uh348c8YpyCu6h25Bu5A+cZullkKiFPempJ7DLbqm+9+WtarSlh
         rvdPhxaMoQPOh0ty1YydAfUuG/+/Z0w3cYLARN8KB0f8oZb2we5TBs+AZVfk4eGqqmd6
         X0Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9560iw1nKYsXX9M2REAxQ850qQCyNOpM2wtwV2s4qwJk5U6joklOzXqQGHl/vIEAxQKcLx4F22rRd2MEM2iyYL@vger.kernel.org
X-Gm-Message-State: AOJu0YzyRRRKj7EYSpBZioC3JI+Kft53TPI9KI1QAjIaJ35aNq2D3sYZ
	R84J0sL/K1AX85CPL99FhpB+aVO470Nq58/N/3H4ZW7qZiUg2Z8SZPIFjlejB3d3uH0YGxi296p
	ZfD0QiR52U29msVc24sCmrrp6dTWIuHn7FCqU0Chgaud6SorgqIvpsaF08pePaQswZXDvppLq
X-Gm-Gg: Acq92OErZysx9JrTFwRgKlfK7zftKpjeLjcrZsppqdM/VyW/WEXU1vG+WQMw3m/V4Dz
	p87lQG9XYp95ygskEInD38hvwSzx8OxIei4LHdC78fBpSkcY2+OZiwiDlpAeELKNHHsVJ3ieJuv
	RECwv9rnvhMdXsTYFJCov6p2nZVClm1xOe3afyRpSOJ14aosLUQggzcQsoDJKiSCGKMYmdEqcRf
	YiZOV9dgV2UGiXHgfdgWPL/lK4l4WvbPF63Uu5suT9Q1pbWff8y7YSVfliEDxE9PH67v2UEGXs1
	aPZEyPJOiTqCK6HikiJqY9dXKUKAKMq8enIyJPeyfbl5HkPwVkNAZ3DYLsjGEroSqJ9xdQcssY2
	vw61kwT7iQpcwPtQo7YfMZztByiZpPXJGPUIgJoxXj0KeKqj1AUK8ue0Wc7AxlQ==
X-Received: by 2002:a05:6a20:3d22:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-3afb1a0a4fbmr4184391637.40.1778696366903;
        Wed, 13 May 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d22:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-3afb1a0a4fbmr4184362637.40.1778696366337;
        Wed, 13 May 2026 11:19:26 -0700 (PDT)
Received: from [192.168.0.110] ([183.82.29.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826768acf3sm18897017a12.10.2026.05.13.11.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:19:25 -0700 (PDT)
Message-ID: <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
Date: Wed, 13 May 2026 23:49:20 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
To: Bjorn Andersson <andersson@kernel.org>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfX5spqYTbpF0pb
 m2fZhjzyv/kyCOE5Km3NTP/BfaB8wARWEYLkYbYnLZojj9Vt7oeIcqpqr+FWihhmxnHAq7D4rgc
 21+Ecfx3ZalY44YNUToMEA/C0slYjl73SQBqZCSGcKVMN9Su44Fp76C1+kMdrx9kx9+catjm6FO
 5sj8ZI+Q1UcWHpjJChn0fUDW03g4c1wYAPgIiDXhoRQyVYF+1Ln9mqhjUewGpAlLYblyaig/SoE
 u6+LJwlfM18E0CsOdFYfw6LKqz0Nlz2p/Pqs0VCWgE+/3CvMfpvco3425TajeXvOZEbpoUdAKsi
 Qt+6U9IujQyp236xesPP/xCiM+FY2be28WHHLGJCc5fpOhtLWry42E6yF2aTHKc06ZsLtgHjwiw
 8p9KBnX1SMnkvdNONS+3OpldFMvF7kVY8fYZnMsqb286FuN+hQl2dpAZw5/myY/fpyGtDOrSvJy
 jJiARIcJ2TdnUqW29ng==
X-Proofpoint-ORIG-GUID: dtu6QkJNW683BSdjLcIhz0f0lBhWvk6I
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04c0af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zhxe3pEVf5X/RQkgbsjYTw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=2DIguSIwZBnVL4SAOv4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: dtu6QkJNW683BSdjLcIhz0f0lBhWvk6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130182

Hi Bjorn,

A gentle reminder to review this series. All the patches have picked
up R-b tags. If it looks okay to you, could you please help pick
it up in the current merge window.

Thanks
Vignesh

On 5/5/2026 3:53 PM, Varadarajan Narayanan wrote:
> As discussed in [4] posting this series after dropping IPQ5424 support
> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
> 
> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> I've resumed Gokul's work as the last submission dates back April 2025.
> 
> - Secure PIL is signed, firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> [4]
> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
> 
> Changes in v12:
> 	- No code change
> 	- Rebase to ToT
> 	- Change quicinc mail ids to oss.qualcomm.com mail ids
> 	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v11:
> 	- Add R-b tags
> 	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
> 	- No change in other patches
> 	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v10:
> 	- Add R-b tags
> 	- Remove unused fields from 'struct wcss_sec'
> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v9:
> 	- Add R-b from Konrad for dts patches
> 	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
> 	- Restore clocks & clock-names in above yaml
> 	- Fix DCO on two patches
> 	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/
> 
> Changes in v8:
> 	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
> 		* IPQ5018 support added in v6
> 		* IPQ5424 support dropped in v8
> 		* Updated to use IPQ9574 as example
> 	- dt-bindings-check and dtbs-check passed
> 	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
> 	- Dropped changes to ipq5424.dtsi
> 	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/
> 
> Changes in v7:
> 	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
> 	- correctly sorted smp2p-wcss nodes in dtsi files
> 	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com
> 
> Changes in v6:
> 	- added patch to fix IPC register offset for ipq5424
> 	- changed phandle description for mboxes property in dt-bindings
> 	- updated bindings to define the right clocks per SoC based on
> 	  compatible. Ran make dt_binding_check for validation of all
> 	  SoCs
> 	- use of more descriptive match data property (use_tmelcom) and
> 	  added a condition in wcss_start to not error out if tmelcom
> 	  isn't used
> 	- mitigated potential off-by-one
> 	- adopted use of of_reserved_mem_region_to_resource to acquire
> 	  memory-region resource
> 	- added driver support for ipq5018 SoC
> 	- corrected size of reg properties as per Konrad's comments
> 	- added patch to bring up Q6 in ipq5018 dtsi
> 	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> 
> Changes in v5:
> 	- retained all the patches as in v3 and addressed comments in
> 	  v3.
> 	- reverted changes to dt-bindings done in v4 and retained as in
> 	  v3 and fixed firmware format from .mdt to .mbn and retained
> 	  reviewed-by.
> 	- dropped 2 patches in v4 that adds support for q6 dtb loading.
> 	  Will post them as a new series.
> 
> 	Following tests were done:
> 	- checkpatch
> 	- dt_binding_check and dtbs_check
> 	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com
> 
> Changes in v4:
>         - changed q6 firmware image format from .mdt to .mbn
>         - corrected arrangement of variable assignemnts as per comments
>           in qcom_scm.c
>         - added scm call to get board machid
>         - added support for q6 dtb loading with support for additional
>           reserved memory for q6 dtb in .mbn format
>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
>           and additional item in memory-region for q6 dtb region.
>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
>           Kconfig
>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
>         - added required check for using tmelcom, if available. Enabled
>           fallback to scm based authentication, if tmelcom is unavailable.
>         - added necessary padding for 8digt hex address in dts
> 	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com
> 
> 	Following tests were done:
> 	- checkpatch
> 	- kernel-doc
> 	- dt_binding_check and dtbs_check
> 
> Changes in v3:
>         - fixed copyright years and markings based on Jeff's comments.
>         - replaced devm_ioremap_wc() with ioremap_wc() in
>           wcss_sec_copy_segment().
>         - replaced rproc_alloc() and rproc_add() with their devres
>           counterparts.
>         - added mailbox call to tmelcom for secure image authentication
>           as required for IPQ5424. Added ipq5424 APCS comatible required.
>         - added changes to scm call to pass metadata size as required for
>           IPQ5332.
> 	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com
> 
> Changes in v2:
>         - Removed dependency of this series to q6 clock removal series
>           as recommended by Krzysztof
> 	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com
> 
> George Moussalem (1):
>   arm64: dts: qcom: ipq5018: add nodes to bring up q6
> 
> Manikanta Mylavarapu (4):
>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>   arm64: dts: qcom: ipq5332: add nodes to bring up q6
>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> 
> Vignesh Viswanathan (1):
>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> 
>  .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
>  drivers/firmware/qcom/qcom_scm.c              |  14 +-
>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>  drivers/remoteproc/Kconfig                    |  19 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
>  include/linux/remoteproc.h                    |   2 +
>  10 files changed, 723 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> 
> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd

