Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E91DE3AC
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Oct 2024 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128643; cv=none; b=SCBaKk6C0Q0zYyNjdJ3JzQXQa6TSP/NmZvmhwd2eEeNA0Ta4kMpQfMFONOnN6QDjC9Z7l2iNVRjxPPldxv6dHEY9Aq5XNc8rLIVMcM43n1OAJ9MfbJVLn39k3dVP9UKoADJ3P9AQylD90v8tqGfmnpGyvzx3Z7aXcJX36yrQTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128643; c=relaxed/simple;
	bh=Ax87HxxUakfr8YXC5k3BVe8BobiydMDDRcWzLJeofv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hppkcCVEywDptM8SH+AOCbZiDyHA6WqtLzyRQLGizOvSuYulvaKYm69ml2z+ydIsJcC8yWhbzq8TEUfwtmlKzU1Y6KBKdzKUWHqKj4VjSmjpQ9JXDghx7gASaUaB8eNGzupshlPElzmgrcpoHA98mnds461kHDRKMRqZdscBF9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnluqPf/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnluqPf/"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so6947155a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Oct 2024 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730128639; x=1730733439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55/ro/7zJvThn66N42PfbJLx9dbqEZPe1RBRRwDigOA=;
        b=MnluqPf/9Ika48rju6NJL1iIjC2fNddd2+5vBu2NM8F3yDntx56xew/yDRzbTpjMVp
         O/sQM14wYV/F0pE77FGqhW0g6PheO65YdoVyd8kD/14Sc1K/7b1Pivo5p/LOAM3ck6TT
         9OwcuD2zk9k06M0TCbtYno4E1vNC7vl1w+NjrqslLNd5gOzRZ28CMIogTUydBMi4/rN+
         SoPbaokUrSvNDwNS+JKu5GC8EeedgXwkTDohFO8+8v1P64mviBrTJZnAARAdAbaqwN7i
         J7DBMNOf/+bWpqClC5vb3IiqrHaH0luWu2mVW/kcJDVkcV6Oh2NoH6HC2mpZNQy+3qaQ
         D7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128639; x=1730733439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55/ro/7zJvThn66N42PfbJLx9dbqEZPe1RBRRwDigOA=;
        b=siBdGAARzqUBty79Led1HuEoRgYcrCJM4wZsyDZVdMQNFElqm0V1GktDVTiu+ocnHY
         OZuZOf5EQziw8PD5b7F3ffHGjc1aCxCb4BvYkPPdgHHxIVlGR1Gc+h2msVUAIObUinyt
         h51mpWqMkl+OGGOsCVuO953I6sU4oCoHrN34jODmL4hCqW+TUz1C3YDPdvSlXRw87XYY
         GWEB6ih5UnsDN5JEwnkkJT8Jpkere5PrzQiAlaD2PW3r0rNy9I1FdBH9g9PXCLAbw35O
         QR+ouL05e/9mJS6Vj48dksWIUzJ+R9cxVWeH2pDGTwRSf9iAE1DVBbN4HbD+QX6Gaw+p
         /V8g==
X-Gm-Message-State: AOJu0YxC+ZyMH6d70d+MYOI16IEjFiURbpj5EzGKyq8XGnqVHlcqbbEr
	FFk7a/EOwbaO6FyWW5ISxRkeWxdxbsUij9qteUdaFVbzV4TeYHRJSUgKMyRQWIQQrTRFvZ/9o61
	BH/dGz2N5dc2nrHFG+qNffmLlHA38Eo8sP/faNw==
X-Google-Smtp-Source: AGHT+IFNHRoMT1azdBbEdqXYLU+6ZEDN58kXAqgF/pFpY/FWiiPNt85IQIsqmlI03mwF2Uu/WESJaRoUUj7qEIuiuPA=
X-Received: by 2002:a05:6402:40d5:b0:5c9:6623:a11a with SMTP id
 4fb4d7f45d1cf-5cbbf94abc2mr7399460a12.25.1730128639232; Mon, 28 Oct 2024
 08:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxzLHcWpjeo9sJGN@fedora>
In-Reply-To: <ZxzLHcWpjeo9sJGN@fedora>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 28 Oct 2024 09:17:07 -0600
Message-ID: <CANLsYkyq5Ge4-RZEPDsvMgqtzL10XonVMdHJOGAbcHyXHWV_Cg@mail.gmail.com>
Subject: Re: Question regarding optimisation of RPMsg round trip times on
 Xilinx ZynqMP hardware
To: Felix Kuhlmann <felix-kuhlmann@gmx.de>
Cc: linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Felix,

On Sat, 26 Oct 2024 at 04:57, Felix Kuhlmann <felix-kuhlmann@gmx.de> wrote:
>
> Hello everybody,
>
> I need your help concerning an error that was returned while trying to
> use the AMD Xilinx implementation of remoteproc. I hope that this is
> the right place to ask for help.
>
> I'm currently working on a project that requires Remoteproc and
> RPMsg. The hardware I am working with is a Trenz SoM containing a
> AMD Zynq UltraScale+ MPSoC, CG variant, DDR3 external RAM and a few
> additional components.
>
> One of the targets of the project is that the communication between
> the RPU and the APU should happen under soft realtime conditions. The
> issue with the communication examples provided by Xilinx is that they
> use the external RAM for the buffers for RPMsg. This results in highly
> non-deterministic communication delay jitter, which is most likely due
> to the fact that DDR RAM is not suited for those applications.
>
> Given that the SoC already has an On-Chip Memory that is designed for such
> applications, I am curious whether changing the shared memory location
> for RPMsg to reside inside of the OCM of the SoC result in a performance
> boost. Do you have any experience with such performance benefits?
>

I do not have direct experience with this kind of configuration but I
would think both vring and vdev buffers would need to be located on
the OCM.  That said the OCM may not be big enough for that or it may
not be accessible by the main processor.  Another option could be to
use non-cached device memory, but there may also be constraints at
that level as well.  This is really HW specifics and I do not have
enough details to provide further guidance.

Thanks,
Mathieu

> I'm currently developing a solution, trying to adopt the examples AMD
> provides, but when trying to boot the fw image, Remoteproc complains that
> it is unable to allocate the memory, saying the fw image size doesn't
> fit the len request. This results in Remoteproc throwing error "-12",
> which simply indicates that booting of the RPU failed. More information
> isn't logged.
>
> I have tried to read the documentation, but I can't really decide which
> aspects I need to bear in mind when trying to adopt my code to use a
> different memory region as a whole.
>
> My previous attempts at circumventing this issue failed, resulting in
> the error above.
> A few of the things I've tried are:
> - Changing the shared memory and the vring addresses to be inside of
> the OCM
> - Adding the OCM and the remoteproc buffers to the device tree
> - Attempting to increase the requested carveout for the firmware
>
> I hope this provides a sufficient overview of my situation. If you need
> further information or logs in order to figure out what went wrong,
> feel free to ask for that.
>
> Thank you in advance and best regards,
>
> Felix Kuhlmann
>
>
