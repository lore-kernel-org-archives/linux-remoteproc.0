Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F838E8CC
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169031; cv=none; b=QwsdhE053qdTyyegoWQnUB1qkmlNXfaf3MmyAuIoPBUulcs9FgZp1LD2zFqMg9zm3udGc8k8Lihiv9z/GO+TTFvLei7W1qQPXacFR376CIhBlxHjmYeOe0v3AgnB2NpcsuXSChMa3ehCATH3jrniJY/IjwmNsN2xOPv4FBj/KVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169031; c=relaxed/simple;
	bh=j4eAY2w32SKbEshmvsYmWzB3GI+jB07TxlyNvC942Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzEbQ6koEBiIHVFo6i6mFDaDxqVPxjhGWLUdgPJ1bmpHnPgBBZr94emTIE4crp0WLjvbOg9FGzEVfJAmCInU/Dp2o8AnR9du9lBRgpk/QP/vNXTAtn/h053QF+nXSvSC7jVOtMKAz+0DQJvhvsaIw2SYxsSFRHpY46n0soFcKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhS9STeM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhS9STeM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so62267145e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781169028; x=1781773828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rWlq4as1LWNFg509PkNNd1MIv6uha19xNkTO/t/tj0=;
        b=QhS9STeMaKgyQFeshDyAKCmjg2vUqzTDFdR3+d9RzDY9eQsoTqzBe6JisJt5NARLMj
         DJf0/ebGlckLWWqXgbe8IRm5sflARdeJHtz0uYyWFNlJlfgc+khz8vzCkGWOmQjyHu29
         SDodJnARar8AUsU3x5QySz3pJ2ov6PBJ6rkbxJvLTTpmB+zqfO9F8wd701CnwHwtVWL9
         qzWcmtMJt69R9e75NkjvFstsQGJeCl57EFsxlY+76YwTAVQd9CwGdeNIIdOKS46y5sE1
         hFhqDBftcBOQxplx2LM0TzGWKnGPb3RLA2nejnZ+GNLYSGSE42bGJvV+Gk4crYthxzRh
         W7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169028; x=1781773828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rWlq4as1LWNFg509PkNNd1MIv6uha19xNkTO/t/tj0=;
        b=SpCWN8j4Vf5iD5J/T6X/LJGzFX/T+yI2s4krZwuqVr352fD9GVGTDiH+ACel63FGpE
         M8XaQj+6VrOwbREwZ+t0Zzqwqrdayf5fyL+fh4RgM/tZ488REcatYjZ1Zvv6fCfkT4ld
         K5V2CCcLqEQzaWJgoGv/AmkKC23QfyPeZWuVQhxZoxwwF23O3tcDQ16YCFNrHzn3nXiu
         hvewifRs3L8BC5RFqaGAbtjz6lVEtpUhx67Matpp0W09WgfmVLiAl29RUShcRr9x3Tz1
         3cQRQCes4dCb5ZGdRO26kN/Wnm/DPZsRjSwZNoeVbilrTDJfuCGeKMcCpW2lYGP8ScyV
         4IAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CPnImr4Eas3xWbhjwcuk3eMsHLUg3rS/GMzA5+Nf2+1ezpdtPaqk7PvvEsBL6O4cb2U9NjaO04KtynSSIThvt@vger.kernel.org
X-Gm-Message-State: AOJu0YzYcQzeHwdTNPikDUsJ53HkxgBdAXd0fRs7NAWoH69by26AMknc
	kGX1kP82u7vmHP2JVKrMsV7PxuKG/oPqYAGuKlfi6iTtFqolfFysVopF0/UjykY0hQA=
X-Gm-Gg: Acq92OH8aSfDK3bwhHGCXh5Aa86M4RM/9TAw1ej2ba33HE3yWWaJVIWmcCbCCPTOCO1
	OlhtF5CNCL/NZcaBI2YEPHm0GsEYJWKF1BG5UG5ypjK1JjLmuVORCAdmipYu8ks8RWi5FofFPKy
	7wV5p9q+oWtGaMfAaG7sa/CcCORkp4gbwQynCVHPwFeQpYjQw23cSpd3F6NunJ3rdO8QFs8D5Q8
	PVakcfkCyGtfOwW4S0hOXPn/XSS19ipnlKVa6nofcLmfQPRJ627Yu08TwPo6Y9lIclW+mKp3duX
	j88S6XdsRDd7jNqMJxWh9QWY22WKB/F3J0wKpHW6I3nFrk/JW0YBXAlEkG/riliHYGzMBoeJG9u
	nBtNL6kYQNNQIMUvE1VJUyy/2PCJvA9OeDIDjM/WNR9NbVZuD1FQpzAARm2DrMIGlulzQih3WCx
	Uf7YNAi823CZ1oT8SdKr1JWh49/5lQqppNDKVFT5Z1P/L1OA==
X-Received: by 2002:a05:600d:6414:20b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490e55e962cmr16950155e9.15.1781169027922;
        Thu, 11 Jun 2026 02:10:27 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm33929275e9.4.2026.06.11.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:10:26 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	shengchao.guo@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <aip7feoTn0ncwzL7@linaro.org>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
> > On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> >> Subsystems can be brought out of reset by entities such as bootloaders.
> >> As the irq enablement could be later than subsystem bring up, the state
> >> of subsystem should be checked by reading SMP2P bits.
> >>
> >> A new qcom_pas_attach() function is introduced. if a crash state is
> >> detected for the subsystem, rproc_report_crash() is called. If the ready
> >> state is detected, it will be marked as "attached", otherwise it could
> >> be the early boot feature is not supported by other entities. In this
> >> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> >> can load the firmware and start the remoteproc.
> >>
> >> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> >> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > 
> > Unfortunately, removing the ping-pong functionality that was present in
> > previous patch versions makes the whole mechanism a lot more fragile.
> > I'm not entirely sure if this has changed in SMP2P v2 or more recent
> > firmware versions, but in my experience the SMP2P "ready" bit does not
> > tell you if the remoteproc is actually running. The problem is that the
> > "ready" bit is asserted by the remoteproc when the firmware is ready,
> > but it is not cleared when you shutdown or forcibly stop the remoteproc.
> > 
> > If this is still the case, you can easily reproduce that with the
> > following test:
> > 
> >  1. Start the system as usual and let it attach the remoteproc
> >  2. Manually stop the remoteproc in sysfs (echo stop > state)
> >  3. modprobe -r qcom_q6v5_pas
> >  4. modprobe qcom_q6v5_pas
> >  5. If the "ready" bit is still set, the driver will try attaching the
> >     remoteproc, but it's actually not running. No recovery will happen.
> > 
> > In this situation, it is very difficult to detect the correct remoteproc
> > state without relying on an additional query mechanism like the
> > ping-pong feature.
> 
> This a valid use case and concern. We had a discussion with Bjorn, and
> want to take this scenario into consideration of the separate robustness
> improvement series[1].
> Stephan could you agree to have the basic function in this series can be
> go in firstly.
> 
> [1]
> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
> 
> > 
> > You can make it a bit more reliable if you also check the status of the
> > "stop-ack" bit. This would tell you if the remoteproc was cleanly
> > stopped with the SMP2P "stop" mechanism. However, that will typically
> > still not fix the case above since nowadays remoteprocs are typically
> > stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> > case. I believe this might set the separate "shutdown-ack" bit though
> > that is described for some SoCs, I never finished testing that.
> > 
> > And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> > tell you if the remoteproc was forcibly killed using
> > qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> > solution would be querying the PAS API to tell us if the remoteproc is
> > actively running, but the last time I checked I was unfortunately not
> > able to find a documented call that would tell us that.
> 
> It is a state currently kernel don't know whether the remoteproc is
> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
> If it is re-modprob, the software don't have any data and only the
> firmware can tell us whether if it is active or not per my understanding.
> 
> Maybe let's have this scenario and solution discussion in the other
> series I mentioned before.
> 

If you add a new feature upstream, you must make sure that it is
reasonably robust and reliable. The other series is about generic
limitations in the remoteproc subsystem, so I don't think you should
move QC-specific parts over there as well (personally, I would have
probably kept all of it in one series to make it easier to understand,
but that's subjective).

With the current firmware design, it's hard - probably impossible - to
make the status detection perfectably reliable. I would therefore choose
some reasonable compromise to start with. Given that Shawn (and actually
me as well) would like to have attach working without firmware support
for the ping-pong functionality, I think it would be reasonable to start
with the basic detection scheme discussed above, i.e.

  ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0

The ping-pong functionality could be added later for platforms that
support it. It would be good to have the interrupts already defined in
the device tree, so you can tweak the driver without making DT changes
later.

Thanks,
Stephan
