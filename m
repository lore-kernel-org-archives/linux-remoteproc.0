Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F211BC2A
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Sep 2024 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726238714; cv=none; b=BZgzjHxVdIMAh/FYNnZqF1NRGTXXKH+9GGCcc3lVdDlfuSDgL/+WeX9Z5Q5jAP9R7AnuYdpz59gBfBI9OlHQlug4r+3/cg/P+YDvHy6MZERFPoBiQMQnkAKEnR0n2x+wHF3ZYJdJcCEKDD+LNk/L/ioQ4PfqYBK1JT40C6PuQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726238714; c=relaxed/simple;
	bh=g2ybvLjs9yiUiIZpkDchh13jHortfCHh94LQJ1NTVQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyIUc24PIf4o0XZbiLaYwGK9v7Hyxr15t+hBhsvyQOBADp33cEBv6QCudKSsu950hp4Izh7WrnbhvgZvgrZ4Pg0hQ/eudgFRvxLW8uwiXQ/miCLohwN2F9cy49dC5CfkK3mxMid/4rrlKCizvJju9Uc2rIGOYsJZw44l05TlvkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOZSeYOY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOZSeYOY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so19057091fa.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Sep 2024 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726238710; x=1726843510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRlsoz0SQi6Y31kBnSS0wNEmQwFLdHQJn6urXpVey+s=;
        b=eOZSeYOYHaJS/OgMMvEGOWpt7Z82u5QnWTgkPC5R/+k/DjCxmYHst1z2BGis5DZ1or
         hMxZPOSVgqm6QsACdsNoFJmqmeJXie1OH2vVx8r+w87AFNw5rD207X74MA73CyvZFVbh
         CKubRBLExbQ8qDc7T3+0GSiFJ2f16VL6PyR+mjC2jj5mYf/UOSgcgiz5ebTvGr8OslUX
         LxJwHlutJgGbaU8aQ1/c3Xa0bQ1t1viUuGOHXgTRxWyHGKXjOkgqXrxnb68o7hD/YbVi
         UeWtFuMJzbf9LgsFLqqR7NZjGXZZQ61Rgwc3+Zw33H6kDmNDwCBU/oIRdcohsOzjETWT
         eyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238710; x=1726843510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRlsoz0SQi6Y31kBnSS0wNEmQwFLdHQJn6urXpVey+s=;
        b=ruK2ndzYglO7GHsxfVvpD/r4barJTm4pBceNG6yi+grHzHDdnRmRtKrhcat7af9pyu
         VBm6T4rq0n7lMek94AZaTT9CG1yMcvVb3QecTe/stfOvwGuofWrY//oXXxCjfO8Fn5BW
         IKWGOE1mPpU1UU3WgdW8OkluJMkKPk4L+K4wjw5GkYC0ajf2cUgXhZPwwMMr+HXMAaZO
         oLwD1wLh0u94f7XxKj0siDV+8lVQbXPfx6k83poL4G4pucJItKG1pJxpkI8OySiZr+Uw
         qIKYeA4vv+Qyrzbqof3lgtLoKbjixtCBwRi87LCGH9GuoKQHww8Zi8xq5qu3sTYfvHAo
         Z84Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQQHZ8pkMw58h6TeJSbnMSe7YpVzBHyYZSvovxbaUH1kMbJV5x7KA7/zNz9iIT+wg7+vv1m2DH7ebChSTaMb2K@vger.kernel.org
X-Gm-Message-State: AOJu0YyOO3r7Xm01+3bpHXPbcIiowIvKDQcDeljohT61lzmx8Jd72gVj
	tohv5JIJVmy9HeQ37SQDS3eRO4meGtYMgPZNks3cfRixyclqjJl1P7GrecH+TrmepnljA+Oa+0q
	mEJfLhlxrGp+ORzIUoAcwC+DnzPv2JH+UcyUbhw==
X-Google-Smtp-Source: AGHT+IHUFXrwlfPMaxEeDNt9yglyljvYbg/DLrmw5ptYs+I26fJbLl2Yz4iDT0/avZHjhVpNTTnBoHkg2kD6Gg/9LqI=
X-Received: by 2002:a2e:4c19:0:b0:2f6:d5e2:7889 with SMTP id
 38308e7fff4ca-2f787ddf348mr27934931fa.19.1726238709788; Fri, 13 Sep 2024
 07:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 13 Sep 2024 08:44:58 -0600
Message-ID: <CANLsYkwC0hW3YPmfxOCW+sQcNVVficvPX0+yhsTnKb70f_4taA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com, 
	conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Valentina,

On Thu, 12 Sept 2024 at 10:48, Valentina Fernandez
<valentina.fernandezalanis@microchip.com> wrote:
>
> Hello all,
>
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox controller, as well as an IPC remoteproc platform driver.
>
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
>
> The Microchip IPC is used to send messages between processors using
> an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
> Binary Interface (SBI) to communicate with software running in machine
> mode (M-mode) to access the IPC hardware block.
>
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
>
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
>
> The IPC remoteproc platform driver allows for starting and stopping
> firmware on the remote cluster(s) and facilitates RPMsg communication.
> The remoteproc attach/detach operations are also supported for use cases
> where the firmware is loaded by the Hart Software Services
> (zero-stage bootloader) before Linux boots.
>
> Error Recovery and Power Management features are not currently
> supported in the remoteproc platform driver.
>
> The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
> dts after the initial upstreaming:
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/
>
> Thanks,
> Valentina
>
> Valentina Fernandez (5):
>   riscv: asm: vendorid_list: Add Microchip Technology to the vendor list
>   dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
>   mailbox: add Microchip IPC support
>   dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
>   remoteproc: add support for Microchip IPC remoteproc platform driver
>
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++
>  .../remoteproc/microchip,ipc-remoteproc.yaml  |  84 +++
>  arch/riscv/include/asm/vendorid_list.h        |   1 +
>  drivers/mailbox/Kconfig                       |  12 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 539 ++++++++++++++++++
>  drivers/remoteproc/Kconfig                    |  12 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/mchp_ipc_remoteproc.c      | 461 +++++++++++++++
>  include/linux/mailbox/mchp-ipc.h              |  23 +
>  10 files changed, 1250 insertions(+)

It might be easier to split this patchset in two and proceed
incrementally, i.e upstream the mailbox driver first and then the
remoteproc part.

Regards,
Mathieu

>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
>  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
>  create mode 100644 drivers/remoteproc/mchp_ipc_remoteproc.c
>  create mode 100644 include/linux/mailbox/mchp-ipc.h
>
> --
> 2.34.1
>
