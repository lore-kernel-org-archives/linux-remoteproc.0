Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685BB1642D
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jan 2024 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OX0NQWNH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d4414ec9c7so38386755ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jan 2024 14:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705099177; x=1705703977; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEELrV2RaLN4JGPsozV4KIejDOePUJR5mjuYdWwn5F4=;
        b=OX0NQWNHf8l6kofi0d2AMZCMKinBoHfY165qAMMejsRHZ89HPBFK1MbYeoYCkE81lL
         DtZnSEEIEGfDJ2GDy+FBiPTGI/AGpPeulV6IkXzhzH8KUlJkLvWRLxdccSXSkHDMCO5e
         /+ZbwAYplPAlGLvoor2+GvNTLN9h/gPt6VqDFThRDqX7if7DQhSr2PbMsw3YlWR4U0Md
         3xUo6Kc5BbqZS86HuJGj014himSrpsM+EnkNKlR+abnnNIorfpjQDo3LCbas48eJpRvw
         nfLln9OCwg+tk/kVpHCaeVVPzVUc7qRmPms+Ol7sDgvP5nObvirG1BMKEXv4xfLnDcCC
         twew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705099177; x=1705703977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEELrV2RaLN4JGPsozV4KIejDOePUJR5mjuYdWwn5F4=;
        b=qZvxHVk+KA+9kbIsf4JdID+FJMWh/lOyNwP4uZ9FRsYmDiqocMDjYNFBMo91BCudpH
         YzNoHI4g+u3hILKr6XpGUNoLq6fejMEnGW8CpDmwll1yfjk14/JDDhUB4BQ0g5MCPthN
         4/HnFSU05UEn3Cf4eOVMuy4h2X8Ysbt9ijYER93RXT0WN3jvczgo6YriSFd3M/lym1xf
         2spzDJ9wCYCJ5Bbe6DytqFwLM/LXN1sKtbqi2wsWW/iqMcp2T/DfO/h4Dax8nPDU+x3F
         hQEBgoGRZTOPHegOSspoJIgnU+GiZqGoYxsbv64PsSpqwhtCxCEg1uddFmVuhmQ0fCni
         fEQw==
X-Gm-Message-State: AOJu0YyGn8HwGt59DmHq35IqO9jC/1Y90v7k4ZMJPTh7mKIYEMlYz1no
	oP+tKwOPy7zpxEhfElIDlKpEc8mfkh/s0AcgxAYtXilGlsM=
X-Google-Smtp-Source: AGHT+IGRngUyMY09ruPFQ6pGZ9cUBIkjFwKf7w5zV6wH9V8DXiV+kZlhgd7IIvXtuSI63b1xVnVBfg==
X-Received: by 2002:a17:902:ee15:b0:1d4:8db0:ab0d with SMTP id z21-20020a170902ee1500b001d48db0ab0dmr1484158plb.48.1705099176671;
        Fri, 12 Jan 2024 14:39:36 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:27cb:7446:2479:70f9])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001d3e3704d2fsm3636150plg.31.2024.01.12.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:39:36 -0800 (PST)
Date: Fri, 12 Jan 2024 15:39:34 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Divin Raj <divin.raj@arm.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	"Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Message-ID: <ZaG/poy9bZQ/nwpK@p14s>
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
 <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
 <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
 <80b61579-4dc5-4e43-924e-edd6ebd514e9@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80b61579-4dc5-4e43-924e-edd6ebd514e9@arm.com>

On Tue, Nov 28, 2023 at 11:19:10AM +0000, Divin Raj wrote:
> On 11/28/23 8:34 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 11/24/23 17:45, Divin Raj wrote:
> > > Hi Arnaud,
> > > Please find my comments inline.
> > > 
> > > On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
> > > > Hi Divin,
> > > > 
> > > > On 11/17/23 23:24, Divin Raj wrote:
> > > > > On 10/23/23 11:44 AM, Divin Raj wrote:
> > > > > > Hello all,
> > > > > > 
> > > > > > I am reaching out with reference to the patch discussed here: Enhanced
> > > > > > virtio rpmsg bus driver buffer allocation.
> > > > > > <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo3mmBqVg@mail.gmail.com/>
> > > > > > 
> > > > > > I've been keenly following the developments around enhancing buffer
> > > > > > allocation strategies, especially those focused on dynamic buffer sizing
> > > > > > and the considerations for systems under varying memory constraints.This
> > > > > > work is highly relevant to several projects I am involved in, and I am
> > > > > > quite interested in its progression. May I kindly request an update on
> > > > > > the current phase of these initiatives? Additionally, I am eager to know
> > > > > > if there would be an opportunity for me to contribute to enhancing the
> > > > > > patch, possibly by working on improvements or assisting in verification
> > > > > > processes.
> > > > > > 
> > > > > > Furthermore, if there are any condensed resources, summaries, or
> > > > > > specific threads that encapsulate recent advancements or discussions on
> > > > > > this topic, I would be grateful to receive directions to them.
> > > > > > 
> > > > > > I appreciate everyone's dedicated efforts and invaluable contributions
> > > > > > to this area of development. Looking forward to the updates.
> > > > > > 
> > > > > > Regards Divin
> > > > > > 
> > > > > Hello Linux Community,
> > > > > 
> > > > > In one of our internal projects, we encountered a challenge with RPMSG
> > > > > buffer allocation. Our goal is to optimize memory allocation for an
> > > > > out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
> > > > > support for packet sizes matching the standard MTU (Maximum Transmission
> > > > > Unit) size of 1500 bytes.
> > > > > 
> > > > > To mitigate this issue, There are few possible solutions:
> > > > > 
> > > > > 1. Configure buffer size and number through Kconfig.
> > > > > 2. Permit the firmware creator to determine the most suitable value from
> > > > >     the resource table.
> > > > > 3. Enable independent configurations on both ends. This approach would
> > > > > support both dynamic and fixed buffer configurations using a generic
> > > > > allocator.
> > > > > 
> > > > > Reference:
> > > > > 
> > > > > [1]:
> > > > > https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@xiaomi.com/
> > > > > [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
> > > > > 
> > > > > 
> > > > > Draft Design Overview:
> > > > > 
> > > > > Based on the reference patch and the discussions, we have outlined the
> > > > > following key points for the belw design:
> > > > > 
> > > > > 1. Assure compatibility, enabling both Linux and the remote system to
> > > > > interchangeably transmit and receive messages, irrespective of size.
> > > > > 2. For systems with constrained shared memory:
> > > > > Systems with small, shared memory, we need to deal with a
> > > > > limited/optimized memory chunk. To avoid memory fragmentation, the
> > > > > allocator should have a pre-reserved buffer pool
> > > > > 3. The implementation should ensure that the remote side does not
> > > > > receive messages based on its allocation parameters.
> > > > > 
> > > > > do you think it could make sense?
> > > > > 
> > > > > High level view:
> > > > > +------------------+                               +------------------+
> > > > > |                  |                               |                  |
> > > > > |      Linux       |                               |      Remote      |
> > > > > |                  |                               |                  |
> > > > > |   +----------+   |       +-----------------+     |   +----------+   |
> > > > > |   |   RPMSG  |   | <---> | Buffer Allocator|<--->|   | RPMSG    |   |
> > > > > |   +----------+   |       | (Dynamic/Static)|     |   +----------+   |
> > > > > |                  |       +-----------------+     |                  |
> > > > > +------------------+                               +------------------+
> > > > > 
> > > > > 
> > > > > Detailed view:
> > > > > 
> > > > >                     +-------------------------+
> > > > >                     |  Message Creation       |
> > > > >                     |  (Both Linux/Remote)    |
> > > > >                     +------------+------------+
> > > > >                                  |
> > > > >                                  v
> > > > >                     +-------------------------+
> > > > >                     | Determine the allocation|
> > > > >                     | strategy                |
> > > > >                     +------------+------------+
> > > > >                                  |
> > > > >                   +--------------+--------------+
> > > > >                   |                             |
> > > > > +-------------------------------+  +-------------------------------+
> > > > > | Dynamic allocation            |  | Static allocation             |
> > > > > | (Buffer allocator allocates   |  | (Pre-reserved memory          |
> > > > > | memory space as needed,       |  | space)                        |
> > > > > | based on the current          |  |                               |
> > > > > | message requirement )         |  |                               |
> > > > > +-------------------------------+  +-------------------------------+
> > > > 
> > > > Do you have a proposal for dynamic allocation?
> > > > 
> > > > RPMSG is based on the virtio protocol. The virtio driver in the Linux kernel
> > > > is responsible for allocating buffers for the virtio device on the remote
> > > > processor.
> > > > 
> > > > In the current implementation (static allocation) the Linux
> > > > kernel allocates predefined buffers for the remote processor.
> > > > 
> > > > How would you manage the fact that the sender allocates its own buffers and
> > > > references
> > > > them in the vring descriptor? This would require each core to have
> > > > a dual role, right?
> > > > - a virtio driver role on its TX vring
> > > > - a virtio device role on its RX vring."
> > > > 

No matter how many times I read this thread I can't figure out what is mean when
using the word "role".

> > > I'm unsure if a dual role is feasible under the Virtio specification.
> > 
> > At least, it does not seem to align with the philosophy of VirtIO.
> > 

Dynamic memory allocation based on packet size would make the implementation
quite complex, and I don't remember any virtio device that do this.

> > 
> > > However, would it make sense to set the size of the outbuf based on the
> > > Maximum Transmission Unit (MTU) size that is supported? Additionally,
> > > the size of the inbuf could be set by the firmware, suggesting that it
> > > should be derived from the resource table. With this approach, I believe
> > > the sender can decide the maximum size.
> > 
> > It is not clear to me what your proposal is.
> > Are you speaking about a pre-allocated buffers as proposed in [1],
> > or are you speaking about dynamic allocation of the RPMsg in a pool?
> 
> we are at the initial phase of this investigation. As we previously
> discussed, option 3 is not feasible in accordance with the virtio
> specification.The above proposed solution aligns with [1], suggesting
> preallocated in_buf and out_buf, with sizes determined from the resource
> table and MTU. By allowing Linux to decide the out_buf size and the
> remote to decide the in_buf size, I believe we can avoid conflicts. If
> everyone agrees on a common idea, then it would be a good starting point
> 

I think Xiao's proposal in [1] was on the right track.  There were a few things
to adjust like the type used in the rpmsg_config structure (_u32 rather than
le32), the lack of a version number and the problem generated by the double
memory allocation.  The latter should likely be cobbled in a single allocation.

That said it leaves no room for error about the size of the rx and tx buffers.

Lastly, any implementation needs to be standard with enhancements to the rpmsg
config space accepted by OASIS. 

I hope this is enough to move forward - let me know if it isn't the case.


> Regards
> Divin
> 
> > Regards,
> > Arnaud
> > 
> > > 
> > > Regards
> > > Divin
> > > 
> > > > 
> > > > Regards,
> > > > Arnaud
> > > > 
> > > 
> > > > 
> > > > > 
> > > > > We would greatly appreciate any feedback, suggestions, or improvements
> > > > > you could provide.
> > > > > 
> > > > > Thank you for your time and consideration.
> > > > > 
> > > > > Regards
> > > > > Divin
> > > > > IMPORTANT NOTICE: The contents of this email and any attachments are
> > > > > confidential and may also be privileged. If you are not the intended recipient,
> > > > > please notify the sender immediately and do not disclose the contents to any
> > > > > other person, use it for any purpose, or store or copy the information in any
> > > > > medium. Thank you.
> > > 
> > > IMPORTANT NOTICE: The contents of this email and any attachments are
> > > confidential and may also be privileged. If you are not the intended recipient,
> > > please notify the sender immediately and do not disclose the contents to any
> > > other person, use it for any purpose, or store or copy the information in any
> > > medium. Thank you.
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> 
