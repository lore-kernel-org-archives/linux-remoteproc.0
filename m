Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81E537E3
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jan 2024 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vjx10awg"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso3129181a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jan 2024 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704994384; x=1705599184; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sea74N6l34io/zNAmg5QhyxrD6j+b05s3EFawvWYdc0=;
        b=Vjx10awg9hDP0YISTqZDwYSa6K46UmbXJP1EBdOuO6ht+SqVlQQr6mAYD2zCngSHMz
         X/cI3Ml7QvsRAxe01oynaVafkaZryqV/5PQlgfho6lOCcDOp+tnfYnc1jj64ruONvu3M
         95ZY18aQCneD8G3e24NWV2XmTV3sxfs3psrvMfLLrtxfGA9RVr82LJNIzxQG2frxpfku
         TGX+q8Z8hlsvYrGONoI/Zy2Y6Gv7bWUo47nk9tMRabinw7wnR9xc3DIXf3OqL0I2rno0
         Z7yQXg19h6cExWO2ppprQmCiSajMvL6IPrUY5T46zL+nxQZO+aBPCKCezUxgwKlzQguA
         CxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704994384; x=1705599184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sea74N6l34io/zNAmg5QhyxrD6j+b05s3EFawvWYdc0=;
        b=HG9JzlZSb7u9HaDzHlgOJ3c86Y/uJZOSGEIqPjldi8Zpnn9niUyWLDzsmjaQWq8LSa
         pFjtHBxM2q1XgLjPnat+TM55DpIGT4FR0/pfjl0zpJ/Lf5GWrWXLrwGlRtthufstN42h
         AOGpCPXvx9Tv/wbyd2anlh4Vi9O1peDsyP5G9Pk4yWUfIz5Jr64etnelwR6N4LIhqT8t
         Y0yQeJfyU2xWMMAop4YzXSv51X1Q2T3UWrXW4fQwP1wFxEHhepD90xyFBuCrqs/uuXhY
         FAwkIjPrevXtwyaB/bqoQdE1xjN/SmWAfZj0T2BGO9xqh7JnUUnCA87MRE+5Kir7T5y3
         oU9w==
X-Gm-Message-State: AOJu0YxLWT1UhDXc7LxF29xQlfoGxMJBGM7+M0AptUc2JfwVyV5jfqL7
	AA06cW4+K3nlyYahK2KXEqOcTjkl89NuxA==
X-Google-Smtp-Source: AGHT+IEJDsfXHNfTHjQMboUVMpVTPNX44F5k/bjHMYf5LFqFQnHrbCgHYG/b04grntAFtKbBb6ad2g==
X-Received: by 2002:a17:90a:c085:b0:28c:e29b:cb69 with SMTP id o5-20020a17090ac08500b0028ce29bcb69mr133277pjs.27.1704994383896;
        Thu, 11 Jan 2024 09:33:03 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c2ad:34d1:c5ca:836d])
        by smtp.gmail.com with ESMTPSA id li16-20020a17090b48d000b0028dfe615140sm158112pjb.56.2024.01.11.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 09:33:03 -0800 (PST)
Date: Thu, 11 Jan 2024 10:33:01 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Divin Raj <divin.raj@arm.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Message-ID: <ZaAmTerImbzkZMye@p14s>
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
 <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
 <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
 <80b61579-4dc5-4e43-924e-edd6ebd514e9@arm.com>
 <38ea2aee-a7b6-4461-a2e8-c809dfa725a4@foss.st.com>
 <f55f4823-c4e6-4034-8d2c-d933efe1177c@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f55f4823-c4e6-4034-8d2c-d933efe1177c@arm.com>

On Thu, Dec 07, 2023 at 12:47:02PM +0000, Divin Raj wrote:
> On 11/28/23 1:45 PM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 11/28/23 12:19, Divin Raj wrote:
> > > On 11/28/23 8:34 AM, Arnaud POULIQUEN wrote:
> > > > 
> > > > 
> > > > On 11/24/23 17:45, Divin Raj wrote:
> > > > > Hi Arnaud,
> > > > > Please find my comments inline.
> > > > > 
> > > > > On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
> > > > > > Hi Divin,
> > > > > > 
> > > > > > On 11/17/23 23:24, Divin Raj wrote:
> > > > > > > On 10/23/23 11:44 AM, Divin Raj wrote:
> > > > > > > > Hello all,
> > > > > > > > 
> > > > > > > > I am reaching out with reference to the patch discussed here: Enhanced
> > > > > > > > virtio rpmsg bus driver buffer allocation.
> > > > > > > > <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo3mmBqVg@mail.gmail.com/>
> > > > > > > > 
> > > > > > > > I've been keenly following the developments around enhancing buffer
> > > > > > > > allocation strategies, especially those focused on dynamic buffer sizing
> > > > > > > > and the considerations for systems under varying memory constraints.This
> > > > > > > > work is highly relevant to several projects I am involved in, and I am
> > > > > > > > quite interested in its progression. May I kindly request an update on
> > > > > > > > the current phase of these initiatives? Additionally, I am eager to know
> > > > > > > > if there would be an opportunity for me to contribute to enhancing the
> > > > > > > > patch, possibly by working on improvements or assisting in verification
> > > > > > > > processes.
> > > > > > > > 
> > > > > > > > Furthermore, if there are any condensed resources, summaries, or
> > > > > > > > specific threads that encapsulate recent advancements or discussions on
> > > > > > > > this topic, I would be grateful to receive directions to them.
> > > > > > > > 
> > > > > > > > I appreciate everyone's dedicated efforts and invaluable contributions
> > > > > > > > to this area of development. Looking forward to the updates.
> > > > > > > > 
> > > > > > > > Regards Divin
> > > > > > > > 
> > > > > > > Hello Linux Community,
> > > > > > > 
> > > > > > > In one of our internal projects, we encountered a challenge with RPMSG
> > > > > > > buffer allocation. Our goal is to optimize memory allocation for an
> > > > > > > out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
> > > > > > > support for packet sizes matching the standard MTU (Maximum Transmission
> > > > > > > Unit) size of 1500 bytes.
> > > > > > > 
> > > > > > > To mitigate this issue, There are few possible solutions:
> > > > > > > 
> > > > > > > 1. Configure buffer size and number through Kconfig.
> > > > > > > 2. Permit the firmware creator to determine the most suitable value from
> > > > > > >      the resource table.
> > > > > > > 3. Enable independent configurations on both ends. This approach would
> > > > > > > support both dynamic and fixed buffer configurations using a generic
> > > > > > > allocator.
> > > > > > > 
> > > > > > > Reference:
> > > > > > > 
> > > > > > > [1]:
> > > > > > > https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@xiaomi.com/
> > > > > > > [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
> > > > > > > 
> > > > > > > 
> > > > > > > Draft Design Overview:
> > > > > > > 
> > > > > > > Based on the reference patch and the discussions, we have outlined the
> > > > > > > following key points for the belw design:
> > > > > > > 
> > > > > > > 1. Assure compatibility, enabling both Linux and the remote system to
> > > > > > > interchangeably transmit and receive messages, irrespective of size.
> > > > > > > 2. For systems with constrained shared memory:
> > > > > > > Systems with small, shared memory, we need to deal with a
> > > > > > > limited/optimized memory chunk. To avoid memory fragmentation, the
> > > > > > > allocator should have a pre-reserved buffer pool
> > > > > > > 3. The implementation should ensure that the remote side does not
> > > > > > > receive messages based on its allocation parameters.
> > > > > > > 
> > > > > > > do you think it could make sense?
> > > > > > > 
> > > > > > > High level view:
> > > > > > > +------------------+                               +------------------+
> > > > > > > |                  |                               |                  |
> > > > > > > |      Linux       |                               |      Remote      |
> > > > > > > |                  |                               |                  |
> > > > > > > |   +----------+   |       +-----------------+     |   +----------+   |
> > > > > > > |   |   RPMSG  |   | <---> | Buffer Allocator|<--->|   | RPMSG    |   |
> > > > > > > |   +----------+   |       | (Dynamic/Static)|     |   +----------+   |
> > > > > > > |                  |       +-----------------+     |                  |
> > > > > > > +------------------+                               +------------------+
> > > > > > > 
> > > > > > > 
> > > > > > > Detailed view:
> > > > > > > 
> > > > > > >                      +-------------------------+
> > > > > > >                      |  Message Creation       |
> > > > > > >                      |  (Both Linux/Remote)    |
> > > > > > >                      +------------+------------+
> > > > > > >                                   |
> > > > > > >                                   v
> > > > > > >                      +-------------------------+
> > > > > > >                      | Determine the allocation|
> > > > > > >                      | strategy                |
> > > > > > >                      +------------+------------+
> > > > > > >                                   |
> > > > > > >                    +--------------+--------------+
> > > > > > >                    |                             |
> > > > > > > +-------------------------------+  +-------------------------------+
> > > > > > > | Dynamic allocation            |  | Static allocation             |
> > > > > > > | (Buffer allocator allocates   |  | (Pre-reserved memory          |
> > > > > > > | memory space as needed,       |  | space)                        |
> > > > > > > | based on the current          |  |                               |
> > > > > > > | message requirement )         |  |                               |
> > > > > > > +-------------------------------+  +-------------------------------+
> > > > > > 
> > > > > > Do you have a proposal for dynamic allocation?
> > > > > > 
> > > > > > RPMSG is based on the virtio protocol. The virtio driver in the Linux kernel
> > > > > > is responsible for allocating buffers for the virtio device on the remote
> > > > > > processor.
> > > > > > 
> > > > > > In the current implementation (static allocation) the Linux
> > > > > > kernel allocates predefined buffers for the remote processor.
> > > > > > 
> > > > > > How would you manage the fact that the sender allocates its own buffers and
> > > > > > references
> > > > > > them in the vring descriptor? This would require each core to have
> > > > > > a dual role, right?
> > > > > > - a virtio driver role on its TX vring
> > > > > > - a virtio device role on its RX vring."
> > > > > > 
> > > > > I'm unsure if a dual role is feasible under the Virtio specification.
> > > > 
> > > > At least, it does not seem to align with the philosophy of VirtIO.
> > > > 
> > > > 
> > > > > However, would it make sense to set the size of the outbuf based on the
> > > > > Maximum Transmission Unit (MTU) size that is supported? Additionally,
> > > > > the size of the inbuf could be set by the firmware, suggesting that it
> > > > > should be derived from the resource table. With this approach, I believe
> > > > > the sender can decide the maximum size.
> > > > 
> > > > It is not clear to me what your proposal is.
> > > > Are you speaking about a pre-allocated buffers as proposed in [1],
> > > > or are you speaking about dynamic allocation of the RPMsg in a pool?
> > > 
> > > we are at the initial phase of this investigation. As we previously
> > > discussed, option 3 is not feasible in accordance with the virtio
> > > specification.The above proposed solution aligns with [1], suggesting
> > > preallocated in_buf and out_buf, with sizes determined from the resource
> > > table and MTU. By allowing Linux to decide the out_buf size and the
> > > remote to decide the in_buf size, I believe we can avoid conflicts. If
> > > everyone agrees on a common idea, then it would be a good starting point
> > 
> > Thanks for the clarification. It seems reasonable to me to start with a
> > pre-allocated buffer with a fixed size specified by the remote firmware.
> > 
> > Bjorn, Mathieu,
> > Please, could you share you point of view on the topic?
> > 
> + Bjorn
> + Mathieu

Arnaud brought this conversation to my attention.  I will address it in the
coming days.

> 
> > Thanks,
> > Arnaud
> > 
> > > 
> > > Regards
> > > Divin
> > > 
> > > > Regards,
> > > > Arnaud
> > > > 
> > > > > 
> > > > > Regards
> > > > > Divin
> > > > > 
> > > > > > 
> > > > > > Regards,
> > > > > > Arnaud
> > > > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > We would greatly appreciate any feedback, suggestions, or improvements
> > > > > > > you could provide.
> > > > > > > 
> > > > > > > Thank you for your time and consideration.
> > > > > > > 
> > > > > > > Regards
> > > > > > > Divin
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
