Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAA28314B
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771914665; cv=none; b=KQRNo7/5BPr58u13ly1DZFa2zN+JAtqbXS+KajaDQdsQnNE+JW4RDZo3Y0UDfpt2vxOsaWtOj479rQdPjI/7wDILI2TRFrARkpBDZ0G4VgV4O0H8h1jmP27wLvLD9+d181q9Wb493YQ5tFlcx1CDcfAI9xmaBGYsDOr2CUxDjxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771914665; c=relaxed/simple;
	bh=WlaofgPeYYNCZ/PNpiXCPwGOJQ5+Gn0NjG59UAqJdBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ528RAjmmwd9Mjv3tkLbRqXm45rlFHBomlXHlNY7yxAB/ZwXAXiQm1cdySg1I7GXIbDFRFlFwmeg4E2kc+ws1KqnD+hgnY03Z0BixycChP6X6d50maUMTQP4cHK4NESFXjvhi1NRe4t7E8n/+sWcQdrnfqVgMQSUmuIGS3Gzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7znZ/P0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lg59MNMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7znZ/P0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lg59MNMh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4M6wi1252377
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 06:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mrnibdhDFWWXaZ2Mcr559Vtn
	d7wiGbsUwg3q2/yPUkA=; b=O7znZ/P0TTfUhxS2fNa6ZoVevQGqYLNeTCTGbJ9A
	KSbf2hef/0etqN6MJHIp5hLrJWxWQv8TezgiglnLCndmjfCeYsbSXKBl+S3iihrL
	+pUm0pV9r7+ryFw0xcYGOiufCVwxlTdd1pkv+bHWdtdf/7/AU5bDvgaFKj6DFA/E
	mB6n8aX5WSQJVQIHRK8bzd+R20T+s1XQvllbUX2BZEnywbbWJ7sFd/WfjZfRYZC3
	+udzw0at6JbdnhwQf4McSm7JkO0M6fgoilH3i6yGzF1RYO49d5GKjiRnA6n9qCaW
	EQHamhkSz9nAY2xiau/lUPTqrOBWbswCbmDHrt3zoSokuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568egy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 06:31:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so5984068085a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771914663; x=1772519463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
        b=Lg59MNMhUNBgzINZS5yT7aaK3K6SlH3k2hM09/dTBLUlBZaL7eTzGpUuACRr/BrvQq
         mB3lJLIMZ/qNYCxil0W2xAI4wY6CrLQJIR04crdENI/NMcv0LgtsBEE2pie+ExnDdFvV
         gDo8JW/q6XLB4/K+XKPQtXeoi52kDRmhgsBJ2WTIKSHq7JPm4eOVll6ZytyVSk45r6FS
         fxxRsujI/MrzJ3g4SnlniiJnSMovy1KQLKyNp03nR1APKij/MYjUAt2cwPzddqIRg7Iz
         FOi1x5ndW6+e31FEoumyYlIQ216c11QFs8rklSPmkxKNrq9vJGTcAC6M32LmfbPm2WX5
         vwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771914663; x=1772519463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
        b=j98OUqs8IONTfrQKJhx9vCuP4kj17uKm7+Pr7kTZk92T7grrxociKp3Zdw6pMDTDde
         3FL4hTtxWR7aWBka7rrc4PtI7bfF+d0fgSHl255Qr0E9USiJAlF7bGzRGLrcLxXmN686
         7mi3vp/FU7h15DDyW5BV03JU/jE1YTSsr/66YTfV4hQ18K9K/8UxUweYp9FZXCkt64sl
         RPWWdGa1csOMZfwgfV+BSmOfgWOysvL4fhrd+SJtinZeGdNLQePtyDlyazCePiNuyhHv
         4WQlddkawXf8kNkh4w6/6vG+BZ2Ots0Ax8A8AUnmJfA+sVuin91HUwUHw1d9EPwiTg+F
         S3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL0BQn433a0l4INQFVBKzc+BRTOfkjf5mGkXSahzak1MGBtbVYt+VSNPaVwrfSwp5+Uv4hSjSpq+BBG8fRm/HR@vger.kernel.org
X-Gm-Message-State: AOJu0YzNT5E/WmmrNiIOHEYFLc2RsoZNMKKUf9TJKUZ/RhR3agwjVIzl
	NEHUdOK0Wozde7QtGJBQSCIeeehaOR2xafOoIe1gxzvXBkbB48675O25m8S7Dq3ephX2Dm1Ao1q
	JnKzi8LSOBjijyyw+10mqi/nC60a6c7C2vbYhkR6ItF9SnarN4nRhWFGehAiFY8jW/28VEfED
X-Gm-Gg: AZuq6aLzMwe4QTfS5k0JA1/uI2R9cDt/7wcZNp5QxhTrvDISKe5KmL6kX8s0+LQgw8v
	N0RpjUU8m5W/p1AvsUxfLddr4zvEnuWxbHUOPnHpzgb7hjiq5089ejIIT0SAlBwOHuJiqM2Cct6
	DhC0PxCQAM0WP+JCzYW1wrXgRkdL0LiOyEJVGE4T+eU6nFTYT4qUZaTAkn0+wO/MPcuTPkW65zt
	mSU13pcLu+Rmfuu1HjCmv1ldlBTuv+2MlxjF7cZpbBXytkmpZV07PZIWTLLSOO4LeUtnRhIyUTj
	zlzu6ThnCemorP8YGqePfFYtaUJF45tSKSDJaTSKHNd2DGcCwGLg1Hl3gq8cCXMFCYSJhHDtaN7
	fQdcLGG2LHwexdkHlMwExhWESes2CguazLLMqWwvqAAKWQ3aPOQ3aPNLW+7NNSDuCHxwht1UB+9
	O9OxG803YWA0KGlU735X/1II5Ym/yWZ7Oc/BE=
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8cb7be3b53bmr2085232285a.9.1771914662495;
        Mon, 23 Feb 2026 22:31:02 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8cb7be3b53bmr2085229485a.9.1771914661995;
        Mon, 23 Feb 2026 22:31:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb498cfsm1989020e87.78.2026.02.23.22.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:30:59 -0800 (PST)
Date: Tue, 24 Feb 2026 08:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
 <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
X-Proofpoint-GUID: ys1erymtWHqUzDMw21Xc79Z0VfvXqWcE
X-Proofpoint-ORIG-GUID: ys1erymtWHqUzDMw21Xc79Z0VfvXqWcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NCBTYWx0ZWRfX2nMTrm/fQYFI
 OWNPPco+yzEcA2sQ5bteAG+9hk6yfTOJqFlOpD4YI0IJcN1fxwivByi4NT8VOTUEaevTyO9eAC+
 lc2sNeRBam06xYAKZnl8WRg3gnU1h2jmRjUtQFokxLBytZE8Dln1nzwXbrE/bAq+KxfdbPeEZni
 y8qwy5fk6MjpsK1lbS0lsWBZuV/hdTqNl39q5ZNXMLEbr8wvfB8f9KzrXrPYhMyRDkBKxCKr1xr
 e7JjrgcXbSriR/ldNnLRQAVHrPwDVocpykoi2+kO/rWwWApsB4+ej8hFqWGECKM0JTcuBxZiuBZ
 ZRSNG4KfNq533ejPiIP7prfAOlnJJTv3o7MnmdxC0bcyO+nRuOtbiam0d9cAYE5jqavtOryvj/v
 xNncU1SzlTSIJELg2cQKPthKCY4o6AwRdxMeAS7R7ItVnrcbFHAnOX9V+wIR7eHXvM6BqlMFb2f
 KnV80cRfFoghrE0CK4g==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d45a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=60J4MCMU89GRG9oapK0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240054

On Tue, Feb 24, 2026 at 11:48:00AM +0530, Sibi Sankar wrote:
> 
> On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
> > On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
> > > 
> > > On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> > > > > On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> > > > > > > On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > > > > > > > Enable ADSP and CDSP on Glymur CRD board.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >    arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> > > > > > > >    1 file changed, 14 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > index 0899214465ac..0eed4faa8b07 100644
> > > > > > > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > @@ -487,6 +487,20 @@ &pon_resin {
> > > > > > > >            status = "okay";
> > > > > > > >    };
> > > > > > > > 
> > > > > > > > +&remoteproc_adsp {
> > > > > > > > + firmware-name = "qcom/glymur/adsp.mbn",
> > > > > > > > +                 "qcom/glymur/adsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&remoteproc_cdsp {
> > > > > > > > + firmware-name = "qcom/glymur/cdsp.mbn",
> > > > > > > > +                 "qcom/glymur/cdsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > Please make sure it gets to L-F (only Kaanapali is there right now)
> > > > > > > 
> > > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > > > > > but the firmware in linux-firmware is (now) targeting IoT devices,
> > > > > > should we use WoA-like names for firmware on Glymur CRD instead
> > > > > > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > > > > > CRD.
> > > > > I think it's simply time to stop pretending the firmware is generic
> > > > > (some fw simply isn't and some fw may come from different/incompatible
> > > > > branchpoints) and include a board name in the path
> > > > Well... CDSP is usually generic, except for WP vs non-WP.
> > > Hey Dmitry/Konrad,
> > > 
> > > Thanks for taking time to review the series :)
> > > 
> > > The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> > > functionality tested on Glymur WP CRD devices.  Given that the firmware
> > > has already landed, can I continue to use the same name as the patch and
> > > have a different name for other boards if something specific has to be
> > > pushed
> > > for IOT?
> > Thank you for a prompt reaction, it took just 20 days. During that
> > time we could have fixed WP firmware filenames, but... linux-firmware
> 
> Hey Dmitry,
> 
> I'm really sorry that this happened this way :( but I was out
> on vacation the past three weeks getting married. A quick
> review comment on the firmware pull request for naming
> change request would also sufficed in the interim. Also to address
> some of your concerns there aren't any plans to push an iot
> specific ADSP/CDSP firmware for Glymur reference devices.

There are no plans to push or there are no plans to have it?

> Also, this series already warrants a re-post so I can still
> accommodate your naming requests with corresponding
> updates to linux-firmware.

Yes, but the linux-firmware has been released with these file names, so
you can't just change them. You will have to provide
backwards-compatibility links, which defeats the purpose.

> 
> -Sibi
> 
> > got released just two days ago, so we can't fix that anymore. Now we
> > don't have any other option than to use a non-standard name for IoT
> > firmware when it comes later.
> > 
> > > -Sibi
> > > 
> > 

-- 
With best wishes
Dmitry
